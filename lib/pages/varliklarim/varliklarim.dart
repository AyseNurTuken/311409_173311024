import 'package:flutter/material.dart';
import 'package:mobildovizapp/provider/app_provider.dart';
import 'package:provider/provider.dart';

class Varliklarim extends StatefulWidget {
  const Varliklarim({Key? key}) : super(key: key);

  @override
  State<Varliklarim> createState() => _VarliklarimState();
}

class _VarliklarimState extends State<Varliklarim> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppProvider>(context, listen: false).getAssets();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Varlıklarım",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Consumer<AppProvider>(
        builder: (context, value, child) {
          return (Provider.of<AppProvider>(context, listen: true).isCurrencyLoading)
              ? const Center(
                  child: const CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/altin/ata.png"),
                          title: const Text("Ata altın"),
                          subtitle: Provider.of<AppProvider>(context, listen: true).isAtaAltinLoading
                              ? buildCountLoading()
                              : Text("${context.read<AppProvider>().ataAltinCount} tane"),
                          trailing:
                              Text(altinTutarHesapla(context.read<AppProvider>().currency?.ataAltin?.sat, context.read<AppProvider>().ataAltinCount)),
                        ),
                      ),
                      Card(
                        child: ListTile(
                            leading: Image.asset("assets/altin/ceyrek.png"),
                            title: const Text("Çeyrek altın"),
                            subtitle: Provider.of<AppProvider>(context, listen: true).isCeyrekAltinLoading
                                ? buildCountLoading()
                                : Text("${context.read<AppProvider>().ceyrekAltinCount} tane"),
                            trailing: Text(altinTutarHesapla(
                                context.read<AppProvider>().currency?.ceyrekAltin?.sat, context.read<AppProvider>().ceyrekAltinCount))),
                      ),
                      Card(
                        child: ListTile(
                            leading: Image.asset("assets/altin/cumhuriyet.png"),
                            title: const Text("Cumhuriyet altını"),
                            subtitle: Provider.of<AppProvider>(context, listen: true).isCumhuriyetAltinLoading
                                ? buildCountLoading()
                                : Text("${context.read<AppProvider>().cumhuriyetAltinCount} tane"),
                            trailing: Text(altinTutarHesapla(
                                context.read<AppProvider>().currency?.cumhuriyetAltini?.sat, context.read<AppProvider>().cumhuriyetAltinCount))),
                      ),
                      Card(
                        child: ListTile(
                            leading: Image.asset("assets/altin/tam.png"),
                            title: const Text("Tam altın"),
                            subtitle: Provider.of<AppProvider>(context, listen: true).isTamAltinLoading
                                ? buildCountLoading()
                                : Text("${context.read<AppProvider>().tamAltinCount} tane"),
                            trailing: Text(
                                altinTutarHesapla(context.read<AppProvider>().currency?.tamAltin?.sat, context.read<AppProvider>().tamAltinCount))),
                      ),
                      Card(
                        child: ListTile(
                            leading: Image.asset("assets/altin/yarim.png"),
                            title: const Text("Yarım altın"),
                            subtitle: Provider.of<AppProvider>(context, listen: true).isYarimAltinLoading
                                ? buildCountLoading()
                                : Text("${context.read<AppProvider>().yarimAltinCount} tane"),
                            trailing: Text(altinTutarHesapla(
                                context.read<AppProvider>().currency?.yarimAltin?.sat, context.read<AppProvider>().yarimAltinCount))),
                      ),
                      Card(
                        child: ListTile(
                            leading: Image.asset("assets/doviz/dollar.png"),
                            title: const Text("Dolar"),
                            subtitle: Provider.of<AppProvider>(context, listen: true).isDolarLoading
                                ? buildCountLoading()
                                : Text("${context.read<AppProvider>().dolarCount} \$"),
                            trailing:
                                Text(dovizTutarHesapla(context.read<AppProvider>().currency?.uSD?.sat, context.read<AppProvider>().dolarCount))),
                      ),
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/doviz/euro.png"),
                          title: const Text("Euro"),
                          subtitle: Provider.of<AppProvider>(context, listen: true).isEuroLoading
                              ? buildCountLoading()
                              : Text("${context.read<AppProvider>().euroCount} €"),
                            trailing:
                            Text(dovizTutarHesapla(context.read<AppProvider>().currency?.uSD?.sat, context.read<AppProvider>().euroCount))
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/doviz/ruble.png"),
                          title: const Text("Ruble"),
                          subtitle: Provider.of<AppProvider>(context, listen: true).isRubleLoading
                              ? buildCountLoading()
                              : Text("${context.read<AppProvider>().rubleCount} Br"),
                            trailing:
                            Text(dovizTutarHesapla(context.read<AppProvider>().currency?.uSD?.sat, context.read<AppProvider>().rubleCount))
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/doviz/sterlin.png"),
                          title: const Text("Sterlin"),
                          subtitle: Provider.of<AppProvider>(context, listen: true).isSterlinLoading
                              ? buildCountLoading()
                              : Text("${context.read<AppProvider>().sterlinCount} £"),
                            trailing:
                            Text(dovizTutarHesapla(context.read<AppProvider>().currency?.uSD?.sat, context.read<AppProvider>().sterlinCount))
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/doviz/kron.png"),
                          title: const Text("Kron"),
                          subtitle: Provider.of<AppProvider>(context, listen: true).isKronLoading
                              ? buildCountLoading()
                              : Text("${context.read<AppProvider>().kronCount} Kr"),
                            trailing:
                            Text(dovizTutarHesapla(context.read<AppProvider>().currency?.uSD?.sat, context.read<AppProvider>().kronCount))
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  Align buildCountLoading() {
    return const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator()),
        ));
  }

  String altinTutarHesapla(String? satisFiyati, adet) {
    if (adet == 0 || adet == null || satisFiyati == null) return "";
    var tutar = double.parse(satisFiyati.replaceAll(',', '')) * adet;
    return tutar.toStringAsFixed(4) + " ₺";
  }

  String dovizTutarHesapla(String? satisFiyati, adet) {
    if (adet == 0 || adet == null || satisFiyati == null) return "";

    var tutar = double.parse(satisFiyati.replaceAll(',', '.')) * adet;
    return tutar.toStringAsFixed(4) + " ₺";
  }
}
