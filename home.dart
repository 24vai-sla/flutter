import'package:flutter/home.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({key?key}):super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'flutter demo',
      debugShowCheckedModeBanner:false,
      theme:ThemeData(
        primarySwatch:Color.pink,
      ),
      home:const HomePage(),
    );
  }

}
