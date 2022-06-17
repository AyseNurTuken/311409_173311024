import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobildovizapp/model/currencymodel.dart';
import 'package:http/http.dart' as http;

class AppProvider extends ChangeNotifier {
  String? email;
  Currency? currency;
  bool isCurrencyLoading = false;
  bool isAssetsLoading = false;

  double ataAltinCount = 0;
  double ceyrekAltinCount = 0;
  double cumhuriyetAltinCount = 0;
  double dolarCount = 0;
  double euroCount = 0;
  double kronCount = 0;
  double rubleCount = 0;
  double sterlinCount = 0;
  double tamAltinCount = 0;
  double yarimAltinCount = 0;

  bool isAtaAltinLoading = false;
  bool isCumhuriyetAltinLoading = false;
  bool isCeyrekAltinLoading = false;
  bool isTamAltinLoading = false;
  bool isYarimAltinLoading = false;
  bool isDolarLoading = false;
  bool isEuroLoading = false;
  bool isSterlinLoading = false;
  bool isRubleLoading = false;
  bool isKronLoading = false;

  Future<void> getAssets() async {
    //oluşabilecek hatalar sonrası eski değerlerin görünmemesi için sıfırlama işlemi
    ataAltinCount = 0;
    ceyrekAltinCount = 0;
    cumhuriyetAltinCount = 0;
    dolarCount = 0;
    euroCount = 0;
    kronCount = 0;
    rubleCount = 0;
    sterlinCount = 0;
    tamAltinCount = 0;
    yarimAltinCount = 0;

    isAssetsLoading = true;
    isAtaAltinLoading = true;
    isCumhuriyetAltinLoading = true;
    isCeyrekAltinLoading = true;
    isTamAltinLoading = true;
    isYarimAltinLoading = true;
    isDolarLoading = true;
    isEuroLoading = true;
    isSterlinLoading = true;
    isRubleLoading = true;
    isKronLoading = true;

    await Future.wait([
      getCurrencyData(),
      FirebaseFirestore.instance.collection("ata").doc(email).get().then((value) async{
        try{
          ataAltinCount = value["ataAdet"].toDouble();
        }catch(err){
          print(err);
        }finally{
          isAtaAltinLoading = false;
        }

      }),
      FirebaseFirestore.instance.collection("ceyrek").doc(email).get().then((value) {
        try{
          ceyrekAltinCount = value["ceyrekAdet"].toDouble();
        }catch(err){
          print(err);
        }finally{
          isCeyrekAltinLoading = false;
        }
      }),

      FirebaseFirestore.instance.collection("cumhuriyet").doc(email).get().then((value) {
        try{
          cumhuriyetAltinCount = value["cumhuriyetAdet"].toDouble();
        }catch(err){
          print(err);
        }finally{
          isCumhuriyetAltinLoading = false;
        }

      }),
      FirebaseFirestore.instance.collection("dolar").doc(email).get().then((value) {
        try{
          dolarCount = value["dolarAdet"].toDouble();
        }catch(err){
          print(err);
        }finally{
          isDolarLoading = false;
        }

      }),
      FirebaseFirestore.instance.collection("euro").doc(email).get().then((value) {


        try{
          euroCount = value["euroAdet"].toDouble();
        }catch(err){
          print(err);
        }finally{
          isEuroLoading = false;
        }
      }),
      FirebaseFirestore.instance.collection("kron").doc(email).get().then((value) {

        try{
          kronCount = value["kronAdet"].toDouble();
        }catch(err){
          print(err);
        }finally{
          isKronLoading = false;
        }

      }),
      FirebaseFirestore.instance.collection("ruble").doc(email).get().then((value) {
        try{
          rubleCount = value["rubleAdet"].toDouble();
        }catch(err){
          print(err);
        }finally{
          isRubleLoading = false;
        }

      }),
      FirebaseFirestore.instance.collection("sterlin").doc(email).get().then((value) {


        try{
          sterlinCount = value["sterlinAdet"].toDouble();
        }catch(err){
          print(err);
        }finally{
          isSterlinLoading = false;
        }
      }),
      FirebaseFirestore.instance.collection("tam").doc(email).get().then((value) {
        try{
          tamAltinCount = value["tamAdet"].toDouble();
        }catch(err){
          print(err);
        }finally{
          isTamAltinLoading = false;
        }
      }),


      FirebaseFirestore.instance.collection("yarim").doc(email).get().then((value) {
        try{
          yarimAltinCount = value["yarimAdet"].toDouble();
        }catch(err){
          print(err);
        }finally{
          isYarimAltinLoading = false;
        }
      }),
    ]);
    isAssetsLoading = false;
    notifyListeners();
  }

  Future<void> getCurrencyData() async {
      isCurrencyLoading = true;
      final baseUrl = "https://finans.truncgil.com/today.json";
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode != 200) {
        isCurrencyLoading = false;
        throw Exception("Veri getirelemedi");
      }

      final convertedResponse = utf8.decode(response.body.runes.toList());
      final myjson2 = json.decode(convertedResponse);
      setCurrency(Currency.fromJson(myjson2));
      isCurrencyLoading = false;
      notifyListeners();
  }

  void setIsCurrencyLoading(isLoading) {
    isCurrencyLoading = isLoading;
    notifyListeners();
  }

  void setCurrency(currencyData) {
    currency = currencyData;
    notifyListeners();
  }

  void setEmail(mail) {
    email = mail;
    notifyListeners();
  }
}
