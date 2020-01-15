import 'package:flutter/material.dart';

class FormIslemleri extends StatefulWidget {
  @override
  _FormIslemleriState createState() => _FormIslemleriState();
}

class _FormIslemleriState extends State<FormIslemleri> {
  String girilenMetin = "";
  FocusNode _focusNode;
  int maxLines = 1;
  TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    textEditingController = TextEditingController(text: "Varsayılan");
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          maxLines = 3;
        } else
          maxLines = 1;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Form İşlemleri"),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "aa",
              onPressed: () {
                textEditingController.text = "butondan geldim";
              },
              child: Icon(Icons.add),
              mini: true,
              backgroundColor: Colors.brown,
            ),
            FloatingActionButton(
              heroTag: "bb",
              onPressed: () {
                FocusScope.of(context).requestFocus(_focusNode);
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/a7.png"), fit: BoxFit.cover)),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.edit),
                      prefixIcon: Icon(Icons.done),
                      filled: true,
                      fillColor: Colors.greenAccent.shade100,
                      hintText: "Metin gir",
                      labelText: "Başlık",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  autofocus: false,
                  maxLines: maxLines,
                  maxLength: 20,
                  controller: textEditingController,
                  focusNode: _focusNode,
                  maxLengthEnforced: true,
                  onChanged: (s) => debugPrint(" on change: $s"),
                  onSubmitted: (s) {
                    debugPrint("on Submit $s");
                    girilenMetin = s;
                  },
                  cursorColor: Colors.pink,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.edit),
                      prefixIcon: Icon(Icons.done),
                      filled: true,
                      fillColor: Colors.greenAccent.shade100,
                      hintText: "Metin gir",
                      labelText: "Başlık",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  autofocus: false,
                  maxLines: 1,
                  maxLength: 20,
                  maxLengthEnforced: true,
                  onChanged: (s) => debugPrint(" on change: $s"),
                  onSubmitted: (s) {
                    debugPrint("on Submit $s");
                    girilenMetin = s;
                  },
                  cursorColor: Colors.pink,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  color: Colors.teal.shade400,
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        girilenMetin,
                        style: TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            wordSpacing: 3),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
