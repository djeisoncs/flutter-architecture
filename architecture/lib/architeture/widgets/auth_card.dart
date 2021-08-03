import 'package:architecture/architeture/api/api_response.dart';
import 'package:architecture/architeture/auth/provider/auth_provider.dart';
import 'package:architecture/architeture/components/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  bool _isLoaging = false;

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();


  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 280,
        width: deviceSize.width * 0.75,
        child: _form(),
      ),
    );
  }

  _form() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          AppText(
            "Login",
            "Digite o login",
            controller: _tLogin,
            validator: _validateLogin,
            textInputAction: TextInputAction.next,
            nextFocus: _focusSenha,
          ),
          SizedBox(
            height: 10,
          ),
          AppText(
            "Senha",
            "Digite a senha",
            passoword: true,
            controller: _tSenha,
            validator: _validateSenha,
            keyboardType: TextInputType.text,
            focusNode: _focusSenha,
          ),
          Spacer(),
          _isLoaging
              ? CircularProgressIndicator()
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    primary: Theme.of(context).primaryColor,
                    textStyle: TextStyle(
                      color: Theme.of(context).primaryTextTheme.button.color,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                  ),
                  child: Text("Login"),
                  onPressed: _onClickLogin,
                ),
        ],
      ),
    );
  }

  void _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    setState(() {
      _isLoaging = true;
    });

    String login = _tLogin.text;
    String senha = _tSenha.text;


    AuthProvider _provider = Provider.of(context, listen: false);

    ApiResponse response = await _provider.logar(login, senha);

    print("Response >>>> $response");

    // _onLogar(await _bloc.login(login, senha));
    setState(() {
      _isLoaging = false;
    });
  }

  String _validateLogin(String value) {
    if (value.isEmpty) {
      return "O digite o login";
    }
    return null;
  }

  String _validateSenha(String value) {
    if (value.isEmpty) {
      return "O digite a senha";
    }
    return null;
  }
}
