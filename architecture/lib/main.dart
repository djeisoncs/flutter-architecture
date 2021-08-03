import 'package:architecture/architeture/auth/provider/auth_provider.dart';
import 'package:architecture/architeture/auth/views/auth_screen.dart';
import 'package:architecture/architeture/utils/cores.dart';
import 'package:architecture/architeture/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new AuthProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teste',
        theme: ThemeData(
          primaryColor: Cores.RED,
          // primarySwatch: Colors.red,
          // accentColor: Colors.deepOrange,
          // fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.AUTH: (context) => AuthScreen(),
        },
      ),
    );
  }
}