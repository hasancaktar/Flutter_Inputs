import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class TarihIslemleri extends StatefulWidget {
  @override
  _TarihIslemleriState createState() => _TarihIslemleriState();
}

class _TarihIslemleriState extends State<TarihIslemleri> {
  @override
  Widget build(BuildContext context) {
    DateTime suAn = DateTime.now();
    DateTime ucAyOncesi = DateTime(2020, suAn.month - 3);
    DateTime yirmiGunSonrasi = DateTime(2020, 1, suAn.day + 20);
    TimeOfDay suankiSaat=TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
              child: Text("Tarih"),
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: suAn,
                        firstDate: ucAyOncesi,
                        lastDate: yirmiGunSonrasi)
                    .then((secilenTarih) {
                  debugPrint(secilenTarih.toString());
                  debugPrint(secilenTarih.toLocal().toString());
                  debugPrint(secilenTarih.toIso8601String());
                  debugPrint(secilenTarih.millisecondsSinceEpoch.toString());
                  debugPrint(secilenTarih.compareTo(DateTime.now()).toString());
                  print(formatDate(secilenTarih, [dd, ':', mm, ':', yyyy])+' - '+formatDate(secilenTarih, [HH, ':', nn, ':', ss]));
                });
              }),
          RaisedButton(child: Text("Saat"), onPressed: () {
            showTimePicker(context: context, initialTime: suankiSaat).then((sSaat){
              debugPrint(sSaat.format(context).toString());
            });
          }),
        ],
      )),
    );
  }
}
