// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:oeh/components/forms/text_form_add.dart';
import 'package:oeh/components/forms/url_form_add.dart';
import '../../core/assets.dart';

class OneCreatePub extends StatefulWidget {
  const OneCreatePub({super.key});

  @override
  State<OneCreatePub> createState() => _OneCreatePubState();
}

class _OneCreatePubState extends State<OneCreatePub> {
  final _formData = Map<String, Object>();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();
  final _opennigTimeController = TextEditingController();
  final _closingTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OEHColors.oehWhite,
      body: Center(
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
                      "Informações do bar",
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
                        _nameController, 'Nome do bar', _formData, 'name'),
                    TextFormFieldAdd(
                        _phoneController, 'Tefelefone', _formData, 'phone'),
                    TextFormFieldAdd(_descriptionController, 'Descrição',
                        _formData, 'description'),
                    UrlFormFieldAdd(_imageController, 'URL da imagem',
                        _formData, 'imageUrl'),
                    TextFormFieldAdd(_opennigTimeController, 'Hora de abertura',
                        _formData, 'opennigTime'),
                    TextFormFieldAdd(_closingTimeController,
                        'Hora de fechamento', _formData, 'closingTime'),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          final model = Map<String, Object>();
                          model['name'] = _nameController.text;
                          model['phone'] = _phoneController.text;
                          model['description'] = _descriptionController.text;
                          model['imageUrl'] = _imageController.text;
                          model['opennigTime'] = _opennigTimeController.text;
                          model['closingTime'] = _closingTimeController.text;
                          Navigator.pushNamed(
                            context,
                            '/two',
                            arguments: model,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: OEHColors.oehPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text('Continuar'),
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
