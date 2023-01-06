//ignore_for_file: prefer_const_constructors


import 'package:aiotfinal/pages/FirstPage.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;





class NewTaipeiPage extends StatefulWidget{
  const NewTaipeiPage({Key? key}) : super(key: key);

  @override
  _NewTaipeiPage createState() =>_NewTaipeiPage();
}
class _NewTaipeiPage extends State<NewTaipeiPage>{
  double sum=0;
  int userLength=0;
  String selectedDate='';
  String avgtmp='';
  String hitmp='';
  String lowtmp='';
  String rainy='';
  String cloud='';
  String allData='';
  List<String> userList=[];
  int tempUserLength=0;
  String strSum='';
  String dropdownValue = '點擊選擇';
  List<String> items = ["點擊選擇"];
  String value = '';

  String querySql="select name, email from users";

  final TextEditingController myController1 = TextEditingController();
  final TextEditingController myController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {

    var appTitle = Text('新北市');


    final text1 = Container(
      margin:EdgeInsets.fromLTRB(15,8,15,8),
      child:Text(allData,style:TextStyle(fontSize:20),),

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
            allData='選中城市的預測資料為：\n平均氣溫：$avgtmp\n最高氣溫：$hitmp\n最低氣溫：$lowtmp\n降雨量：$rainy\n風力：$cloud';



          }
      ),
    );

    final getName=Container(
      child:
      ElevatedButton(
        child: Text('重新整理資料'),
        onPressed:() {
          send();
        },
      ),
    );

    final jmpLogin=Container(
      child:
      ElevatedButton(
        child: Text('往上頁'),
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
          SizedBox(height: 10,),
          Center(child:SizedBox(width: 300,child: dropDownButton,),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[getName,SizedBox(width:10),getH],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[text1],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[jmpLogin],
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
    String url="http://140.120.183.226/xampp/test/aiotrequest.php";
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

  void add()  async{
    String url="http://140.120.183.226/xampp/test/add.php";
    var _urlAdd=Uri.parse(url);
    var response=await http.post(
        _urlAdd,
        body: {

          "username": myController1.text,
          "height":myController2.text ,
        });
    print(response.body);
    // Map<String, dynamic> user = jsonDecode(response.body);

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
