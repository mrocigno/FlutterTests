import 'package:flutter/material.dart';
import 'dart:developer';

abstract class LoginDialogCallbacks{

  void logged();

}

class LoginDialog extends StatelessWidget {

  LoginDialog({
    @required this.context,
    @required this.callbacks
  });

  final LoginDialogCallbacks callbacks;
  final BuildContext context;

  void doLogin(){
    Navigator.of(context).pop();
    callbacks.logged();
  }

  void show(BuildContext context){
    showDialog(context: context, builder: build);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      elevation: 20,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 2, color: Colors.black)
      ),
      backgroundColor: Colors.grey,
      content: Column(
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[

          Material(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
                )
              ),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ],
                )
              ),
            ),


          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Wrap(
                runSpacing: 10,
                children: <Widget>[
                  WhiteTextField(
                    labelText: "Email",
                  ),
                  WhiteTextField(
                    obscure: true,
                    labelText: "Senha",
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: FlatButton(
                      color: Colors.white,
                      onPressed: doLogin,
                      child: Text("Logar")
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WhiteTextField extends TextField {

  WhiteTextField({
    Key key,
    this.obscure = false,
    this.labelText
  }) : super(key: key);

  final String labelText;
  final bool obscure;

  @override
  Color get cursorColor => Colors.white;

  @override
  // TODO: implement style
  TextStyle get style => TextStyle(
    color: Colors.white
  );

  @override
  InputDecoration get decoration => InputDecoration(
    isDense: true,
    labelStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    labelText: labelText,
  );

  @override
  // TODO: implement obscureText
  bool get obscureText => obscure;

}