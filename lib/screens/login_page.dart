// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oeh/core/assets.dart';
import 'package:oeh/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OEHColors.oehWhite,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OEHAssets.getHeader(100),
                  const SizedBox(
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
                  const SizedBox(
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
                          width: 3,
                          color: OEHColors.oehPurple,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'Digite seu email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
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
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        login(_emailController.text, _passwordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: OEHColors.oehPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text('Entrar'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Ainda não possui uma conta?'),
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

  void login(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      var body = {
        'email': email,
        'password': password,
      };
      http.Response response = await http.post(
        Uri.parse('http://192.168.0.119:8000/api/token/'),
        body: body,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> token = jsonDecode(response.body);
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('access', 'Bearer ${token['access'].toString()}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login feito com sucesso'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pushReplacementNamed(AppRoutes.PUB_OVERVIEW);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email ou senha incorretos'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
