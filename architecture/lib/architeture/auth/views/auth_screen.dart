import 'package:architecture/architeture/utils/cores.dart';
import 'package:architecture/architeture/widgets/auth_card.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: Cores.RED,
        ),
        Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.all(16),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 56,
                ),
              ),
              AuthCard(),
            ],
          ),
        ),
      ],
    ));
  }
}
