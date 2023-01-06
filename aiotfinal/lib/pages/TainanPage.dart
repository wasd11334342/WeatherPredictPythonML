//ignore_for_file: prefer_const_constructors


import 'package:aiotfinal/pages/FirstPage.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;





class TainanPage extends StatefulWidget{
  const TainanPage({Key? key}) : super(key: key);

  @override
  _TainanPage createState() =>_TainanPage();
}
class _TainanPage extends State<TainanPage>{
  String selectedDate='';
  String avgtmp='';
  String hitmp='';
  String lowtmp='';
  String rainy='';
  String cloud='';
  String allData='';
  List<String> userList=[];
  String dropdownValue = '點擊選擇';
  List<String> items = ["點擊選擇"];


  String querySql="select name, email from users";

  final TextEditingController myController1 = TextEditingController();
  final TextEditingController myController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {

    var appTitle = Text('台南市');


    final text1 = Container(
      margin:EdgeInsets.fromLTRB(15,8,15,8),
      child:Text(allData,style:TextStyle(fontSize:20),),

    );
    final text2 = Container(
      margin:EdgeInsets.fromLTRB(15,8,15,8),
      child:Text('從下面選擇一個日期來預測氣象..',style:TextStyle(fontSize:20),),

    );

    final getH=Container(
      child:
      ElevatedButton(
          child: Text('確定'),
          onPressed:() async {
            Map<String,dynamic> x=await post();
            setState(() {

            });
            print(x);
            avgtmp=x['avgtmp'];
            hitmp=x['hitmp'];
            lowtmp=x['lowtmp'];
            rainy=x['rainy'];
            cloud=x['cloud'];
            allData='選中城市為：台南市 \n\n未來七日的預測資料為：\n\n平均氣溫：$avgtmp\n最高氣溫：$hitmp\n最低氣溫：$lowtmp\n降雨量：$rainy\n風力：$cloud';



          }
      ),
    );

    final getDate=Container(
      child:
      ElevatedButton(
        child: Text('載入預測資料'),
        onPressed:() {
          send();
        },
      ),
    );

    final jmpFirst=Container(
      child:
      ElevatedButton(
        child: Text('回首頁'),
        onPressed:()=>{
          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false),
        },
      ),
    );

    Widget dropDownButton=DropdownSearch<String>(
      mode: Mode.MENU,
      items: items,
      dropdownSearchDecoration: const InputDecoration(
          labelText: "Select Name"
      ),
      onChanged: (String? s){
        selectedDate=s!;
        print('selectedDate =$selectedDate');

      },
      selectedItem: items[0],

    );


    var appBody = SingleChildScrollView(
      padding:EdgeInsets.fromLTRB(0,100,0,0),
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[SizedBox(width:20),SizedBox(width:10),],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[text2],
          ),
          SizedBox(height: 20,),
          Center(child:SizedBox(width: 300,child: dropDownButton,),),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[getDate,SizedBox(width:10),getH],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[text1],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[jmpFirst],
          ),
        ],
      ),

    );
    var appBar = AppBar(
      title: appTitle,
      backgroundColor: Colors.blue,
    );
    var app= MaterialApp(
      home:Scaffold(
        appBar: appBar,
        body: appBody,
        backgroundColor: Color(0xF3F3ECD2),
      ),
    );
    return app;
  }

  Future<Map<String, dynamic>> post()async{
    String url="http://140.120.183.226/xampp/test/aiotrequestTainan.php";
    var _url=Uri.parse(url);

    var response = await http.post(
        _url,

        body: {
          "date": selectedDate
        }
    );
    //print(response.body);
    Map<String, dynamic> data = jsonDecode(response.body);

    //print(user['height']);
    return data;
  }


  void send()async{
    String url="http://140.120.183.226//xampp/test/senddate.php";
    var _url=Uri.parse(url);
    var response = await http.post(
      _url,
    );
    List<dynamic> user = jsonDecode(response.body);
    userList=user.map((s) => s as String).toList();
    print(user);
    print(user.length);
    setState(() {
      items=items+userList;
    });
  }


}
