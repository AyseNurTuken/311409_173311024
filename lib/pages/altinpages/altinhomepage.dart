import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobildovizapp/appdrawer.dart';
import 'package:mobildovizapp/model/currencymodel.dart';
import 'package:http/http.dart' as http;
import 'package:mobildovizapp/pages/altinpages/ceyrekaltin.dart';
import 'package:mobildovizapp/pages/dovizpages/euro.dart';
import 'package:mobildovizapp/pages/dovizpages/dolar.dart';
import 'package:mobildovizapp/pages/altinpages/tamaltin.dart';
import 'package:mobildovizapp/pages/altinpages/yarimaltin.dart';
import 'package:mobildovizapp/pages/altinpages/cumhuriyetaltini.dart';
import 'package:mobildovizapp/pages/altinpages/ataaltin.dart';

class AltinHomePage extends StatefulWidget {
  @override
  State<AltinHomePage> createState() => _AltinHomePageState();
}

class _AltinHomePageState extends State<AltinHomePage> {
  Future<Currency> getCurrency() async {
    final baseUrl = "https://finans.truncgil.com/today.json";
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode != 200) {
      throw Exception("Veri getirelemedi");
    }
    final convertedResponse = utf8.decode(response.body.runes.toList());
    final myjson2 = json.decode(convertedResponse);
    return Currency.fromJson(myjson2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Döviz App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getCurrency(),
          builder: (context, AsyncSnapshot<Currency> currency) {
            if (!currency.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
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
                                  'İsim',
                                ),
                              ),
                            )),
                            TableCell(
                                child: Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Alış',
                                ),
                              ),
                            )),
                            TableCell(
                                child: Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Satış',
                                ),
                              ),
                            )),
                            TableCell(
                                child: Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Değişim',
                                ),
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CeyrekAltin(
                                  currency.data!.ceyrekAltin!.al.toString(),
                                  currency.data!.ceyrekAltin!.sat.toString())));
                    },
                    child: createRow(
                        "Çeyrek Altın",
                        currency.data!.ceyrekAltin!.al.toString(),
                        currency.data!.ceyrekAltin!.sat.toString(),
                        currency.data!.ceyrekAltin!.deIIm.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TamAltin(
                                  currency.data!.tamAltin!.al.toString(),
                                  currency.data!.tamAltin!.sat.toString())));
                    },
                    child: createRow(
                        "Tam Altın",
                        currency.data!.tamAltin!.al.toString(),
                        currency.data!.tamAltin!.sat.toString(),
                        currency.data!.tamAltin!.deIIm.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YarimAltin(
                                  currency.data!.yarimAltin!.al.toString(),
                                  currency.data!.yarimAltin!.sat.toString())));
                    },
                    child: createRow(
                        "Yarım Altın",
                        currency.data!.yarimAltin!.al.toString(),
                        currency.data!.yarimAltin!.sat.toString(),
                        currency.data!.yarimAltin!.deIIm.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CumhuriyetAltin(
                                  currency.data!.cumhuriyetAltini!.al
                                      .toString(),
                                  currency.data!.cumhuriyetAltini!.sat
                                      .toString())));
                    },
                    child: createRow(
                        "Cumhuriyet Altını",
                        currency.data!.cumhuriyetAltini!.al.toString(),
                        currency.data!.cumhuriyetAltini!.sat.toString(),
                        currency.data!.cumhuriyetAltini!.deIIm.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AtaAltin(
                                  currency.data!.ataAltin!.al.toString(),
                                  currency.data!.ataAltin!.sat.toString())));
                    },
                    child: createRow(
                        "Ata Altın",
                        currency.data!.ataAltin!.al.toString(),
                        currency.data!.ataAltin!.sat.toString(),
                        currency.data!.ataAltin!.deIIm.toString()),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget createRow(String deger1, String deger2, String deger3, String deger4) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              //offset: Offset(0, 3), // changes position of shadow
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
                    deger1,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              )),
              TableCell(
                  child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    deger2,
                  ),
                ),
              )),
              TableCell(
                  child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    deger3,
                  ),
                ),
              )),
              TableCell(
                  child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    deger4,
                    style: TextStyle(
                        color: deger4[1] == "-" ? Colors.red : Colors.green),
                  ),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
