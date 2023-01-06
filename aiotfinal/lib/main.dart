// @dart=2.9
import 'package:flutter/material.dart';
import 'package:aiotfinal/pages/FirstPage.dart';
import 'package:aiotfinal/pages/TaipeiPage.dart';
import 'package:aiotfinal/pages/TaichungPage.dart';
import 'package:aiotfinal/pages/TainanPage.dart';
//--no-sound-null-safety
//如何更新ios APP的版本號？每次要發布時在terminal輸入
//flutter build ios --build-name=1.0.0(三位數版本號)
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //runApp(MyApp());
  realRunApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "main",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: FirstPage(),
    );
  }

}

void realRunApp() {

  runApp(MaterialApp(
    title: 'Flutter',
    routes: <String, WidgetBuilder>{
      //注册后不走路由生成钩子方法
      '/': (BuildContext context) => FirstPage(),
      '/1': (BuildContext context) =>TaipeiPage(),
      '/2': (BuildContext context) =>TaichungPage(),
      '/3': (BuildContext context) =>TainanPage(),


    },
  ));
}





