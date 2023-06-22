import 'package:flutter/material.dart';
import 'package:oeh/components/forms/text_form_add.dart';
import 'package:oeh/models/user.dart';
import 'package:oeh/models/users_list.dart';
import 'package:provider/provider.dart';
import '../core/assets.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formData = Map<String, Object>();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();
  bool _isLoading = false;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Provider.of<UsersList>(context, listen: false)
          .addUserData(_formData)
          .then((value) {
        setState(() => _isLoading = true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário cadastrado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final user = ModalRoute.of(context)?.settings.arguments as User?;
      if (user != null) {
        _formData['id'] = user.id;
        _formData['name'] = user.name;
        _formData['email'] = user.email;
        _formData['passwor1'] = user.password;
        _formData['passwor2'] = user.password;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OEHColors.oehWhite,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: OEHColors.oehPurple,
              ),
            )
          : Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          OEHAssets.getHeader(100),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Cadastro de bar",
                            style: TextStyle(
                              color: OEHColors.oehPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormFieldAdd(
                              _nameController, 'Nome', _formData, 'name'),
                          TextFormFieldAdd(
                              _emailController, 'Email', _formData, 'email'),
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
                            controller: _password1Controller,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            onSaved: (value) =>
                                _formData['password1'] = value ?? '',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Repita a senha novamente',
                                labelStyle: TextStyle(
                                  color: OEHColors.oehPurple,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: OEHColors.oehPurple),
                                    borderRadius: BorderRadius.circular(20))),
                            controller: _password2Controller,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            onSaved: (value) =>
                                _formData['password2'] = value ?? '',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: OEHColors.oehPurple,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: Text('Salvar'),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ),
    );
  }
}
