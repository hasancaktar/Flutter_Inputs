import 'package:flutter/material.dart';

class TextveFormField extends StatefulWidget {
  @override
  _TextveFormFieldState createState() => _TextveFormFieldState();
}

class _TextveFormFieldState extends State<TextveFormField> {
  String _adSoyad;
  String _eMail;
  String _sifre;

  final formKey = GlobalKey<FormState>();
  bool otomatiKontrol = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(accentColor: Colors.orange, hintColor: Colors.green
              // primaryColor: Colors.red
              ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text("Form"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.save),
          ),
          body: Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/a7.png"),fit: BoxFit.cover)),
            child: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: formKey,
              autovalidate: otomatiKontrol,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Adınız ve soyadınız",
                        labelText: "Ad soyad",
                        prefixIcon: Icon(Icons.account_circle),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.orange, width: 5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 5)),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                    validator: _adSoyadKontrol,
                    onSaved: (deger) => _adSoyad = deger,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Mail adresiniz",
                        labelText: "Mail",
                        prefixIcon: Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.orange, width: 5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 5)),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                    validator: _emailKonrtol,
                    onSaved: (deger) => _eMail = deger,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,

                    decoration: InputDecoration(
                        hintText: "Parolanız",
                        labelText: "Parola",
                        prefixIcon: Icon(Icons.lock),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.orange, width: 5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 5)),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String girilenSifre) {
                      if (girilenSifre.length < 6)
                        return "Şifre en az 6 karakter olmalı";
                      else
                        return null;
                    },
                    onSaved: (deger) => _sifre = deger,
                  ),
                  RaisedButton.icon(
                    color: Colors.blueAccent,
                    icon: Icon(Icons.save),
                    label: Text("Kaydet"),
                    onPressed: _girilenVerileriOnayla,
                  ),
                ],
              ),
            ),
          ),)),
    );
  }

  void _girilenVerileriOnayla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint("Mail: $_eMail "
          "Şifre: $_sifre "
          "Ad Soyad: $_adSoyad");
    } else {
      setState(() {
        otomatiKontrol = true;
      });
    }
  }

  String _emailKonrtol(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) return "Geçerli bir mail adresi girin";
  }

  String _adSoyadKontrol(String girilenVeri) {
    if (girilenVeri.length < 6)
      return "Ad soyadn az 6 karakter olmalı";
    else
      return null;
  }
}
