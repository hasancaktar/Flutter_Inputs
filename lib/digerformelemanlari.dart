import 'package:flutter/material.dart';

class DigerElemanlar extends StatefulWidget {
  @override
  _DigerElemanlarState createState() => _DigerElemanlarState();
}

class _DigerElemanlarState extends State<DigerElemanlar> {
  bool checkBoxState = false;
  String sehir = "";
  bool SwitchState = false;
  double sliderDeger = 1;
  String secilenRenk = "Kirmizi";
  List<String> listeSehirler = [
    "Ankara",
    "İstanbul",
    "İzmir",
    "Bursa",
    "Bolu",
    "Kocaeli",
    "Konya",
    "Van"
  ];
  String secilenSehir = "Ankara";
  List<String> listeIlceler = [
    "Akşehir",
    "Selçuklu",
    "Meram",
    "Seydişehir",
    "Beyşehir"
  ];
  String secilenIlce = "Selçuklu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diğer Elemanlar"),
        backgroundColor: Color.fromRGBO(122, 21, 123, 12),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/a7.png"), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                CheckboxListTile(
                    title: Text("Checkbox Başlık"),
                    subtitle: Text("Checkbox Alt Başlık"),
                    activeColor: Colors.red,
                    secondary: Icon(Icons.account_circle),
                    value: checkBoxState,
                    onChanged: (secildi) {
                      //SETSTATE İLE KENDİMİZ TETİKLEDİK
                      setState(() {
                        checkBoxState = secildi;
                      });
                    }),
                Divider(
                  height: 30,
                  color: Colors.black,
                ),
                RadioListTile(
                    title: Text("Ankara"),
                    value: "Ankara",
                    subtitle: Text("RadioButton Alt Başlık"),
                    secondary: Icon(Icons.location_city),
                    activeColor: Colors.red,
                    groupValue: sehir,
                    onChanged: (secim) {
                      setState(() {
                        debugPrint("Seçilen:$secim");
                        sehir = secim;
                      });
                    }),
                RadioListTile(
                    title: Text("İstanbul"),
                    subtitle: Text("RadioButton Alt Başlık"),
                    secondary: Icon(Icons.location_city),
                    value: "İstanbul",
                    activeColor: Colors.red,
                    groupValue: sehir,
                    onChanged: (secim) {
                      setState(() {
                        debugPrint("Seçilen:$secim");
                        sehir = secim;
                      });
                    }),
                RadioListTile(
                    title: Text("İzmir"),
                    value: "İzmir",
                    subtitle: Text("RadioButton Alt Başlık"),
                    secondary: Icon(Icons.location_city),
                    activeColor: Colors.red,
                    groupValue: sehir,
                    onChanged: (secim) {
                      setState(() {
                        debugPrint("Seçilen:$secim");
                        sehir = secim;
                      });
                    }),
                Divider(
                  color: Colors.black,
                  height: 20,
                ),
                SwitchListTile(
                    title: Text("Switch Başlık"),
                    subtitle: Text("Switch Alt başlık"),
                    secondary: Icon(Icons.select_all),
                    //activeTrackColor: Colors.yellow,
                    value: SwitchState,
                    onChanged: (secim) {
                      setState(() {
                        SwitchState = secim;
                        debugPrint("anlaşma onaylandı $secim");
                      });
                    }),
                Divider(
                  color: Colors.black,
                  height: 20,
                ),
                Text("Değeri Slider'dan seç:"),
                Slider(
                  value: sliderDeger,
                  onChanged: (secilenDeger) {
                    setState(() {
                      sliderDeger = secilenDeger;
                    });
                  },
                  min: 0,
                  max: 100,
                  label: sliderDeger.toString(),
                  activeColor: Colors.blueAccent,
                  divisions: 100,
                ),
                Divider(
                  height: 10,
                  color: Colors.black,
                ),
                Center(
                  child: DropdownButton<String>(
                    hint: Text("Seçiniz"),
                    value: secilenRenk,
                    items: [
                      DropdownMenuItem(
                        value: "Kirmizi",
                          child: Row(
                        children: <Widget>[
                          Container(
                            width: 20,
                            height: 20,
                            color: Colors.red,
                            margin: EdgeInsets.only(right: 10),
                          ),
                          Text(" Kırmızı")
                        ],
                      )),
                      DropdownMenuItem(
                          value: "Mavi",
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 20,
                                height: 20,
                                color: Colors.blue,
                                margin: EdgeInsets.only(right: 10),
                              ),
                              Text("Mavi"),
                            ],
                          )),
                      DropdownMenuItem(
                          value: "Yeşil",
                          child: Row(children: <Widget>[
                            Container(
                              width: 20,
                              height: 20,
                              color: Colors.green,
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Text("Yeşil"),
                          ])),
                    ],
                    onChanged: (String secilen) {
                      setState(() {
                        secilenRenk = secilen;
                      });
                    },
                  ),
                ),
                Divider(color: Colors.black,height: 10,),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton<String>(
                      value: secilenSehir,
                      items: listeSehirler.map((oAnkiSehir) {
                        return DropdownMenuItem(
                          child: Text(oAnkiSehir),
                          value: oAnkiSehir,
                        );
                      }).toList(),
                      onChanged: (s) {
                        setState(() {
                          secilenSehir = s;
                        });
                      },
                    ),
                    DropdownButton<String>(
                        value: secilenIlce,
                        items: listeIlceler.map((oAnkiIlce) {
                          return DropdownMenuItem(
                            child: Text(oAnkiIlce),
                            value: oAnkiIlce,
                          );
                        }).toList(),
                        onChanged: (i) {
                          setState(() {
                            secilenIlce = i;
                          });
                        })
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
