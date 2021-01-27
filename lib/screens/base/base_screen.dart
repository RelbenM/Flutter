import 'package:flutter/material.dart';
import 'package:flutter_store/common/custom_drawer/custom_drawer.dart';
import 'package:flutter_store/models/page_menager.dart';
import 'package:flutter_store/screens/base/login/login_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageMenager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
         LoginScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(title: Text('home2')),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(title: Text('home3')),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(title: Text('home4')),
          ),

          Container(color: Colors.red,
            child: RaisedButton(child: Text('proximo'),
                onPressed: (){
              pageController.jumpToPage(1);
            }),
          ),
        ],
      ),
    );
  }
}
