// ignore_for_file: prefer_const_constructors
import 'package:aiotfinal/pages/NewTaipeiPage.dart';
import 'package:aiotfinal/pages/TainanPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aiotfinal/main.dart';
import 'package:aiotfinal/pages/TaipeiPage.dart';
import 'package:aiotfinal/pages/TaichungPage.dart';


class FirstPage extends StatefulWidget{
  @override
  _FirstPage createState() =>_FirstPage();
}
class _FirstPage extends State<FirstPage>{
  @override
  Widget build(BuildContext context) {
    var appTitle = Text('一週天氣預測系統');

    final TaipeiBtn=ElevatedButton(
      child: Text("台北市"),
      style:  ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blueAccent),                //背景颜色
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> TaipeiPage() ));
      },
    );
    final NewTaipeiBtn=ElevatedButton(
      child: Text("新北市"),
      style:  ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey),                //背景颜色
      ),
      onPressed: () {


      },
    );
    final TaoYuanBtn=ElevatedButton(
      child: Text("桃園市"),
      style:  ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey),                //背景颜色
      ),
      onPressed: () {

      },
    );
    final TaichungBtn=ElevatedButton(
      child: Text("台中市"),
      style:  ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blueAccent),                //背景颜色
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> TaichungPage() ));
      },
    );
    final TainanBtn=ElevatedButton(
      child: Text("台南市"),
      style:  ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blueAccent),                //背景颜色
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> TainanPage() ));
      },
    );
    final KaohsiungBtn=ElevatedButton(
      child: Text("高雄市"),
      style:  ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey),                //背景颜色
      ),
      onPressed: () {

      },
    );


    var appBar = AppBar(
      title: appTitle,
      backgroundColor: Colors.blue,
    );

    var app= MaterialApp(
      home:Scaffold(
        appBar: appBar,
        body:Container(
          constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/TWbackground.png"),
            fit: BoxFit.cover,
          )
      ),


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 18),
          Row(
              children:<Widget>[const SizedBox(width:170,),TaipeiBtn,const SizedBox(width:50,),NewTaipeiBtn,]),
          const SizedBox(height: 10),
          Row(
              children:<Widget>[const SizedBox(width:90,),TaoYuanBtn,]),
          const SizedBox(height: 70,),
          Row(
              children:<Widget>[const SizedBox(width:30,),TaichungBtn,]),
          const SizedBox(height:180,),
          Row(
              children:<Widget>[const SizedBox(width:30,),TainanBtn,]),
          const SizedBox(height:50,),
          Row(
              children:<Widget>[const SizedBox(width:30,),KaohsiungBtn,]),
          const SizedBox(width:80,),
        ],
      ),
    ),

      ),
    );
    return app;
  }

}