import 'package:flutter/material.dart';
import 'package:flutter_store/helpers/validators.dart';
import 'package:flutter_store/models/user.dart';
import 'package:flutter_store/models/user_menager.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: Consumer<UserMenager>(
              builder: (_, userMenager,child){
                return ListView(
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      enabled: !userMenager.load,
                      decoration: InputDecoration(hintText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email) {
                        if(!emailvalid(email))
                          return 'Email invalido';
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: passController,
                      enabled: !userMenager.load,
                      decoration: InputDecoration(hintText: 'Senha'),
                      autocorrect: false,
                      validator: (pass) {
                        if (pass.isEmpty || pass.length < 6) return 'Senha invalida';
                        return null;
                      },
                    ),
                    child,
                    SizedBox(height: 16),
                    SizedBox(height: 44,
                      child: RaisedButton(onPressed: userMenager.load ? Null : (){
                        if(formkey.currentState.validate()){
                          context.read<UserMenager>().singIn(
                              user: User(
                                email: emailController.text,
                                pass: passController.text,
                              ),
                              onFail: (e){
                                scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text('Falha ao entrar: $e'),
                                      backgroundColor: Colors.red,
                                    )
                                );
                              },
                              onSuccess: (){
                                ///FAZER LOGIN
                              }
                          );
                        }
                      },
                        color: Theme.of(context).primaryColor,
                        disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,

                        child: userMenager.load ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ) :
                        Text('Entrar', style: TextStyle(fontSize: 18.0),),
                      ),
                    ),
                  ],
                );
              },
              child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: Text('Esqueci a senha'))
              ),
            ),
          ),
        ),
      ),
    );
  }
}
