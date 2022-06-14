import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobildovizapp/appdrawer.dart';
import 'package:mobildovizapp/pages/dovizpages/dovizhomepage.dart';
import 'package:mobildovizapp/provider/app_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mailController = TextEditingController();
  final sifreController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String errorMessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Giriş Yap",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                height: 70,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
                  child: TextFormField(
                    controller: mailController,
                    validator: (girilenmail) {
                      if (girilenmail == "") {
                        return "Mail Alanı Boş Bırakılamaz";
                      } else if (!girilenmail!.contains("@")) {
                        return "Geçersiz Mail Adresi Girdiniz";
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
                  child: TextFormField(
                    obscureText: true,
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "Şifre Boş olamaz.";
                      }
                      if (password.length < 6) {
                        return "Şifre 6 karakterden az olamaz.";
                      }
                      return null;
                    },
                    controller: sifreController,
                    decoration: InputDecoration(
                      hintText: 'Şifre',
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (mailController.text == "aysenur@admin.com" &&
                              sifreController.text == "123456") {
                            Provider.of<AppProvider>(context, listen: false).setEmail(mailController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DovizHomePage()));
                          } else {
                            setState(() {
                              errorMessage = "Hatalı Mail/Şifre";
                            });
                          }
                        }
                      },
                      child: Text("Giriş Yap")),
                ),
              ),
              Container(
                  width: double.infinity,
                  child: Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
