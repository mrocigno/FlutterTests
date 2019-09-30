import 'package:flutter/material.dart';
import 'Dialog/Dialog.dart';
import 'dart:developer';

class Login extends StatefulWidget {
  Login({Key key, this.title, this.pass}) : super(key: key);

  final String title;
  final int pass;

  @override
  State<StatefulWidget> createState() => LoginBuilder();
}

class LoginBuilder extends State<Login> implements LoginDialogCallbacks {
  double elevation = 15;
  bool logg = false;
  String message = "Você só pode ver este conteúdo se estiver logado!";

  @override
  void logged() {
    logg = true;
    setState(() {
      message = "Você está logado";
    });
    log("Create");
  }

  void funcTeste(context) {
    LoginDialog(
      context: context,
      callbacks: this,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Column(
            children: <Widget>[
            CustomHeader(
              height: 55,
              elevation: elevation,
              title: widget.title,
            ),
            Flexible(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      runSpacing: 20,
                      children: <Widget>[
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                          ),
                        ),
                        Container(
                          child: logg? null : FlatButton(
                            onPressed: (){funcTeste(context);},
                            child: Text("Logar"),
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        )));
  }

}

class CustomHeader extends StatelessWidget {
  CustomHeader({Key key, this.height, this.elevation, this.title})
      : super(key: key);

  final double height;
  final double elevation;
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),
      height: height,
      child: Material(
        color: Color(0xfff5f5f5),
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Wrap(
            direction: Axis.vertical,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
