import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobildovizapp/appdrawer.dart';
import 'package:mobildovizapp/model/currencymodel.dart';
import 'package:http/http.dart' as http;
import 'package:mobildovizapp/pages/dovizpages/euro.dart';
import 'package:mobildovizapp/pages/dovizpages/dolar.dart';
import 'package:mobildovizapp/pages/dovizpages/sterlin.dart';
import 'package:mobildovizapp/pages/dovizpages/ruble.dart';
import 'package:mobildovizapp/pages/dovizpages/kron.dart';

class DovizHomePage extends StatefulWidget {
  @override
  State<DovizHomePage> createState() => _DovizHomePageState();
}

class _DovizHomePageState extends State<DovizHomePage> {
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
      resizeToAvoidBottomInset: false,
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
                              builder: (context) => Dolar(
                                  currency.data!.uSD!.al.toString(),
                                  currency.data!.uSD!.sat.toString())));
                    },
                    child: createRow(
                        "Dolar",
                        currency.data!.uSD!.al.toString(),
                        currency.data!.uSD!.sat.toString(),
                        currency.data!.uSD!.deIIm.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Euro(
                                  currency.data!.eUR!.al.toString(),
                                  currency.data!.eUR!.sat.toString())));
                    },
                    child: createRow(
                        "Euro",
                        currency.data!.eUR!.al.toString(),
                        currency.data!.eUR!.sat.toString(),
                        currency.data!.eUR!.deIIm.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Sterlin(
                                  currency.data!.gBP!.al.toString(),
                                  currency.data!.gBP!.sat.toString())));
                    },
                    child: createRow(
                        "Sterlin",
                        currency.data!.gBP!.al.toString(),
                        currency.data!.gBP!.sat.toString(),
                        currency.data!.gBP!.deIIm.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Ruble(
                                  currency.data!.rUB!.al.toString(),
                                  currency.data!.rUB!.sat.toString())));
                    },
                    child: createRow(
                        "Ruble",
                        currency.data!.rUB!.al.toString(),
                        currency.data!.rUB!.sat.toString(),
                        currency.data!.rUB!.deIIm.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Kron(
                                  currency.data!.dKK!.al.toString(),
                                  currency.data!.dKK!.sat.toString())));
                    },
                    child: createRow(
                        "Kron",
                        currency.data!.dKK!.al.toString(),
                        currency.data!.dKK!.sat.toString(),
                        currency.data!.dKK!.deIIm.toString()),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget createRow(String isim, String alis, String satis, String degisim) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 14, 9, 9).withOpacity(0.5),
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
                    isim,
                  ),
                ),
              )),
              TableCell(
                  child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    alis,
                  ),
                ),
              )),
              TableCell(
                  child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    satis,
                  ),
                ),
              )),
              TableCell(
                  child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    degisim,
                    style: TextStyle(
                        color: degisim[1] == "-" ? Colors.red : Colors.green),
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

/**
 * Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(deger1),
          Text(deger2),
          Text(deger3),
          Text(
            deger4,
            style:
                TextStyle(color: deger4[1] == "-" ? Colors.red : Colors.green),
          ),
        ],
      )
 */