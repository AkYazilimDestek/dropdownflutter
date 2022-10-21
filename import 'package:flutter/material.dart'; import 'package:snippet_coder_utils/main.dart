import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : _Iskele()
      )
    );
  }
}


class _Iskele extends StatefulWidget {
  const _Iskele({Key? key}) : super(key: key);

  @override
  State<_Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<_Iskele> {
  List<dynamic> countries = [];
  List<dynamic> statesMastes = [];
  List<dynamic> states = [];


  String? countryId;
  String? stateId;

  void initState(){
    super.initState();
    this.countries.add({"val": 1,"label":"KAYSERİ"});
    this.countries.add({"val": 2,"label":"ADANA"});
    this.statesMastes = [
      {"ID" : 1,"Name":"ilçe KAYSERİ-1","parentId":1},
      {"ID" : 2,"Name":"ilçe KAYSERİ-2","parentId":1},
      {"ID" : 3,"Name":"ilçe KAYSERİ-3","parentId":1},
      {"ID" : 4,"Name":"ilçe ADANA-1","parentId":2},
      {"ID" : 5,"Name":"ilçe ADANA-2","parentId":2},
      {"ID" : 6,"Name":"ilçe ADANA-3","parentId":2},
      {"ID" : 7,"Name":"ilçe ADANA-4","parentId":2},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("AĞAĞIDAKİ CANLILARDAN BİRİNİ SEÇİNİZ"),
        ),
        body: Column(
          children: [
            FormHelper.dropDownWidgetWithLabel(
                context, "SELECT COUNTRY",
                "İL",
                this.countryId, this.countries,
                (onChangedVal){
                  this.countryId = onChangedVal;
                  print("elected Country : $onChangedVal");
                  setState((){

                    this.states = this.statesMastes.where(
                            (stateItem) => stateItem["parentId"].toString() == onChangedVal.toString()
                    ).toList();

                  });
                  this.stateId = null;
                },
                (onValidateVal) {
                  if (onValidateVal == null){
                    return 'Please Select Country';
                  }
                  return null;
                },
                borderColor : Theme.of(context).primaryColor,
                borderFocusColor:  Theme.of(context).primaryColor,
                borderRadius: 10,
                optionValue: "val",
                optionLabel: "label",
            ),
            FormHelper.dropDownWidgetWithLabel(
                context,
                "State",
                "Select State",
                this.stateId,
                this.states,
                (onChangedVal){
                  this.stateId = onChangedVal;
                  print("Select state : $onChangedVal");
                },
            (onValidate) {
                return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,
            optionValue: "ID",
            optionLabel: "Name",
            ),
          ],
        ),
      ),
    );
  }
}
