import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : _Vucut(),
    );
  }
}

class _Vucut extends StatefulWidget {
  const _Vucut({Key? key}) : super(key: key);

  @override
  State<_Vucut> createState() => _VucutState();
}

class _VucutState extends State<_Vucut> {
    String UrunKat = "";
    List<dynamic> UrunKategoriler = [
      {"UrunKat":1,"KatAdi":"Kat 1"},
      {"UrunKat":2,"KatAdi":"Kat 2"},
      {"UrunKat":3,"KatAdi":"Kat 3"},
      {"UrunKat":4,"KatAdi":"Kat 4"},
    ];

    String Urun = "";
    List<dynamic> UrunListesi = [
      {"UrunID":1,"UrunAdi":"ÜRÜN 1","Kat":1},
      {"UrunID":2,"UrunAdi":"ÜRÜN 2","Kat":1},
      {"UrunID":3,"UrunAdi":"ÜRÜN 3","Kat":1},
      {"UrunID":4,"UrunAdi":"ÜRÜN 4","Kat":2},
      {"UrunID":5,"UrunAdi":"ÜRÜN 5","Kat":2},
      {"UrunID":6,"UrunAdi":"ÜRÜN 6","Kat":2},
      {"UrunID":7,"UrunAdi":"ÜRÜN 7","Kat":3},
      {"UrunID":8,"UrunAdi":"ÜRÜN 8","Kat":3},
      {"UrunID":9,"UrunAdi":"ÜRÜN 9","Kat":3},
      {"UrunID":10,"UrunAdi":"ÜRÜN 10","Kat":3},
      {"UrunID":11,"UrunAdi":"ÜRÜN 11","Kat":4},
      {"UrunID":12,"UrunAdi":"ÜRÜN 12","Kat":4},
      {"UrunID":13,"UrunAdi":"ÜRÜN 13","Kat":4},
      {"UrunID":14,"UrunAdi":"ÜRÜN 14","Kat":4},
    ];
    List<dynamic> UrunSecim = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DROPDOWN"),
      ),
      body : Column(
        children: [
              FormHelper.dropDownWidgetWithLabel(
                context,
                "Ürün Kat",
                "Ürün Kat",
                this.UrunKat,
                this.UrunKategoriler,
                  (onChangedVal) {
                      setState(() {
                        this.UrunKat = onChangedVal;
                        this.UrunSecim = this.UrunListesi.where((element) => element["Kat"].toString() == onChangedVal.toString()).toList();
                      });
                  },
                  (onValidate) {
                   return null;
                  },
                borderColor: Theme.of(context).primaryColor,
                borderFocusColor: Theme.of(context).primaryColor,
                optionLabel: "KatAdi",
                optionValue: "UrunKat"
              ),

          FormHelper.dropDownWidgetWithLabel(
            context,
            "ÜRÜNLER",
            "ÜRÜNLER",
            this.Urun,
            this.UrunSecim,
              (onChangedVal) {
                setState(() {
                this.Urun = onChangedVal;
                });
              },
              (onValidate) {
                return null;
              },
            borderRadius: 10,
            borderFocusColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            optionLabel: "UrunAdi",
            optionValue: "UrunID",
          )
        ],
      ),
    );
  }
}

