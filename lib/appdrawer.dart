import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobildovizapp/model/currencymodel.dart';
import 'package:http/http.dart' as http;
import 'package:mobildovizapp/pages/altinpages/altinhomepage.dart';
import 'package:mobildovizapp/pages/dovizpages/dovizhomepage.dart';
import 'package:mobildovizapp/pages/dovizpages/euro.dart';
import 'package:mobildovizapp/pages/dovizpages/dolar.dart';
import 'package:mobildovizapp/pages/loginpage.dart';
import 'package:mobildovizapp/pages/varliklarim/varliklarim.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white60,
        child: Column(
          children: [
            Container(
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.only(bottom: 0),
                accountName: Text("Ayşenur Tüken"),
                accountEmail: Text("aysenur@admin.com"),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DovizHomePage())),
                      child: ListTile(
                        title: Text(
                          "Döviz Kurları",
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AltinHomePage())),
                      child: ListTile(
                        title: Text(
                          "Altın Kurları",
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Varliklarim())),
                      child: ListTile(
                        title: Text(
                          "Varlıklarım",
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: Container(
                  child: Row(mainAxisSize: MainAxisSize.max, children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.red,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Çıkış yap",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
