import 'dart:math';

import 'package:architecture/architeture/widgets/auth_card.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(215, 117, 255, 0.5),
                Color.fromRGBO(255, 188, 117, 0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 40,
                ),
                transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepOrange.shade900,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black26,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'Minha Loja',
                  style: TextStyle(
                    color: Theme.of(context).accentTextTheme.headline6.color,
                    fontSize: 45,
                    fontFamily: 'Anton',
                  ),
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
