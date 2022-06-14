import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class YarimAltin extends StatefulWidget {
  late String yarimAlis;
  late String yarimSatis;
  YarimAltin(this.yarimAlis, this.yarimSatis);

  @override
  State<YarimAltin> createState() => _YarimAltinState();
}

class _YarimAltinState extends State<YarimAltin> {
  bool isLoading = false;
  String dropdownValue = 'Alış';
  late double adet;
  double toplamTutar = 0;
  final controller = TextEditingController();
  String islemTuru = "";
  String aciklamaMetni = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Yarım Altın",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 7)),
                  ],
                ),
                margin: EdgeInsets.all(4),
                child: Table(
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        TableCell(
                            child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              'Alış : ${widget.yarimAlis}',
                            ),
                          ),
                        )),
                        TableCell(
                            child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              'Satış : ${widget.yarimSatis}',
                            ),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: DropdownButton<String>(
                        value: dropdownValue,
                        items: <String>['Alış', 'Satış']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        }),
                  ),
                  Container(
                    width: 150,
                    child: TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration:
                          InputDecoration(helperText: "Adet değeri Giriniz"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: 100,
                  child: ElevatedButton(
                    child: Text("Hesapla"),
                    onPressed: () {
                      if (controller.text.isEmpty) {
                        setState(() {
                          aciklamaMetni = "Adet değeri boş olamaz..";
                        });
                      } else {
                        adet = double.parse(controller.text);
                        if (dropdownValue == "Alış") {
                          setState(() {
                            isLoading = true;
                            aciklamaMetni = "...";
                            islemTuru = dropdownValue;
                            toplamTutar = double.parse(widget.yarimAlis.replaceAll(',', '')) * adet;
                            FirebaseFirestore.instance
                                .collection("yarim")
                                .doc(Provider.of<AppProvider>(context, listen: false).email)
                                .get()
                                .then((value) async {
                              if (value.exists) {
                                await FirebaseFirestore.instance
                                    .collection("yarim")
                                    .doc(Provider.of<AppProvider>(context, listen: false).email)
                                    .update({"yarimAdet": value["yarimAdet"] + adet});
                              } else {
                                await FirebaseFirestore.instance
                                    .collection("yarim")
                                    .doc(Provider.of<AppProvider>(context, listen: false).email)
                                    .set({"yarimAdet": adet});
                              }
                              setState(() {
                                isLoading = false;
                              });
                              aciklamaMetni = "${adet.toInt()} adet $islemTuru tutarı : ${toplamTutar.toStringAsFixed(4)} ₺";
                            });
                          });
                        } else {
                          setState(() {
                            isLoading = true;
                            aciklamaMetni = "...";
                            islemTuru = dropdownValue;
                            toplamTutar = double.parse(widget.yarimSatis.replaceAll(',', '')) * adet;
                            FirebaseFirestore.instance
                                .collection("yarim")
                                .doc(Provider.of<AppProvider>(context, listen: false).email)
                                .get()
                                .then((value) async {
                              if (value.exists) {
                                if (value["yarimAdet"] < adet) {
                                  setState(() {
                                    aciklamaMetni =
                                    "Sahip olduğunuz miktardan fazlasını satamazsınız. Sahip olduğunuz yarim altın miktarı : ${value["yarimAdet"]}";
                                  });
                                } else {
                                  await FirebaseFirestore.instance
                                      .collection("yarim")
                                      .doc(Provider.of<AppProvider>(context, listen: false).email)
                                      .update({
                                    "yarimAdet": value["yarimAdet"] - adet,
                                  });
                                  setState(() {
                                    aciklamaMetni = "${adet.toInt()} adet $islemTuru tutarı : ${toplamTutar.toStringAsFixed(4)} ₺";
                                  });
                                }
                              } else {
                                setState(() {
                                  aciklamaMetni = "Sahip olduğunuz miktardan fazlasını satamazsınız. Sahip olduğunuz yarim altın miktarı : 0";
                                });
                              }
                              isLoading = false;
                            });
                          });
                        }
                        print(toplamTutar);
                      }
                    },
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(aciklamaMetni),
              ),
              SizedBox(
                height: 20,
              ),
              isLoading ? CircularProgressIndicator() : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
