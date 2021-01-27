import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_store/helpers/firebase_errors.dart';
import 'package:flutter_store/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_store/helpers/firebase_errors.dart';

class UserMenager extends ChangeNotifier{
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseUser user;
  bool _load = false;
  bool get load => _load;

  Future<void> singIn({User user, Function onFail, Function onSuccess})async{
    load = true;
    try{
      final AuthResult result =
      await auth.signInWithEmailAndPassword(email: user.email, password: user.pass);

      this.user = result.user;

     onSuccess();
    }on PlatformException catch(e){
      onFail(getErrorString(e.code));
    }
    load = true;
  }

  set load(bool value){
    _load = value;
    notifyListeners();
  }

  void _loadCurrentUser()async{
    FirebaseUser currentUser = await auth.currentUser();
    if(currentUser!=null){
      user = currentUser;
      print(user.uid);
    }
    notifyListeners();
  }
}