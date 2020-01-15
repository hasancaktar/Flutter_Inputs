import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inputapp/datetime.dart';
import 'package:inputapp/digerformelemanlari.dart';
import 'package:inputapp/stapperform.dart';
import 'formfield.dart';
import 'form.dart';

class NavigationIslemi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text("Menü"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/a6.png"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormIslemleri()));
                },
                color: Colors.deepPurple,
                child: Text(
                  "Forma Git",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TextveFormField()));
                },
                color: Colors.deepPurple,
                child: Text(
                  "Form2'ye Git",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DigerElemanlar()));
                },
                color: Colors.deepPurple,
                child: Text(
                  "Diğer Form Elemanlarına Git",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TarihIslemleri()));
                },
                color: Colors.deepPurple,
                child: Text(
                  "DateTime Picker",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StapperFormu()));
                },
                color: Colors.deepPurple,
                child: Text(
                  "Stapper Gösterimi",
                  style: TextStyle(fontSize: 20),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
