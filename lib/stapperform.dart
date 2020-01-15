import 'package:flutter/material.dart';

class StapperFormu extends StatefulWidget {
  @override
  _StapperFormuState createState() => _StapperFormuState();

}

class _StapperFormuState extends State<StapperFormu> {
  int _aktifStep = 0;
  String kAdi;
  String mail;
  String sifre;
  bool hata = false;
  List<Step> _tumStepler;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tumStepler = tumStepler();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,
        title: Text("Stapper Form"),
      ),
      body: Container(
       // decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/a7.png"), fit: BoxFit.cover)),
        child: Stepper(
          steps: _tumStepler,
          currentStep: _aktifStep,
          /*onStepTapped: (tiklanilanStep) {
              setState(() {
                _aktifStep = tiklanilanStep;
              });
            },*/
          onStepContinue: () {
            setState(() {
              _ileriButonKontrol();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifStep > 0)
                _aktifStep--;
              else
                _aktifStep = 0;
            });
          },
        ),
      ),
    );
  }

  List<Step> tumStepler() {
    List<Step> stepler = [
      Step(
          title: Text("Kullanıcı adı"),
          subtitle: Text("Kullanıcı adı alt başlık"),
          state: _stateleriAyarla(0),
          isActive: true,
          content: TextFormField(
            key: key0,
            onSaved: (girilenDegerKAdi) {
              kAdi = girilenDegerKAdi;
            },
            validator: (girilenDegerKAdi) {
              if (girilenDegerKAdi.length < 6)
                return "En az 6 karakter giriniz";
            },
            decoration: InputDecoration(
                labelText: "Kullanıcı adı label",
                hintText: "Kullanıcı adı hint",
                border: OutlineInputBorder()),
          )),
      Step(
        title: Text("Mail"),
        subtitle: Text("Mail alt başlık"),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          onSaved: (girilenDegerMail) {
            mail = girilenDegerMail;
          },
          validator: (girilenDegerMail) {
            if (girilenDegerMail.length < 6 || !girilenDegerMail.contains("@"))
              return "En az 6 karakter giriniz";
          },
          decoration: InputDecoration(
              labelText: "Mail label",
              hintText: "Mail hint",
              border: OutlineInputBorder()),
        ),
      ),
      Step(
          title: Text("Şifre"),
          subtitle: Text("Şifre alt başlık"),
          state: _stateleriAyarla(2),
          isActive: true,
          content: TextFormField(
            key: key2,
            decoration: InputDecoration(
                labelText: "Şifre label",
                hintText: "Şifre hint",
                border: OutlineInputBorder()),
            validator: (girilendegersifre) {
              if (girilendegersifre.length < 6)
                return "En az 6 karakter olmalı";
            },
            onSaved: (girilendegersifre) {
              sifre = girilendegersifre;
            },
          ))
    ];
    return stepler;
  }

  StepState _stateleriAyarla(int oAnkiStep) {
    if (_aktifStep == oAnkiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else
      return StepState.complete;
  }

  void _ileriButonKontrol() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState.validate()) {
          key0.currentState.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;
      case 1:
        if (key1.currentState.validate()) {
          key1.currentState.save();
          hata = false;
          _aktifStep = 2;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (key2.currentState.validate()) {
          key2.currentState.save();
          hata = false;
          _aktifStep = 2;
          _formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void _formTamamlandi() {
    print("Kullanıcı Adı: $kAdi, Mail: $mail, Sifre: $sifre");
  }
}
