import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'models/user_menager.dart';
import 'screens/base/base_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(ChangeNotifierProvider(
    create: (_)=> UserMenager(),
    child: MaterialApp(
      home: BaseScreen(),
      title: 'Loja Relben',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          appBarTheme: const AppBarTheme(
            elevation: 0
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
    ),
  ));
}
