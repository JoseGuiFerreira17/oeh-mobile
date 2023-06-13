// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print, constant_identifier_names, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:oeh/core/assets.dart';
import 'package:oeh/data/dummy_user.dart';
import 'package:oeh/models/user.dart';
import 'package:oeh/utils/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final List<User> loadedPubs = dummyUsers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OEHColors.oehWhite,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OEHAssets.getHeader(100),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Acesso do proprietário",
                    style: TextStyle(
                      color: OEHColors.oehPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: OEHColors.oehPurple,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: OEHColors.oehPurple),
                            borderRadius: BorderRadius.circular(20))),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Digite seu email';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: OEHColors.oehPurple,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: OEHColors.oehPurple),
                            borderRadius: BorderRadius.circular(20))),
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Digite sua senha';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        final loginSuccess = SnackBar(
                          content: Text(
                            "Cadatro realizado com sucesso",
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.green,
                        );
                        login(_emailController.text, _passwordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: OEHColors.oehPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text('Entrar'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Ainda não possui uma conta?'),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.USER_CREATE,
                            );
                          },
                          child: Text(
                            'Cadastre-se aqui!',
                            style: TextStyle(
                              color: OEHColors.oehPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void login(String email, String password) {
    Navigator.of(context).pushNamed(
      AppRoutes.PUB_OVERVIEW,
    );
  }

  final snackBar = SnackBar(
    content: Text(
      "Email ou senha inválidos",
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );

  final loginSuccess = SnackBar(
    content: Text(
      "Cadatro realizado com sucesso",
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.green,
  );
}
