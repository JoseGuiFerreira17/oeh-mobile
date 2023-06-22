// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:oeh/components/forms/number_form_add.dart';
import 'package:oeh/components/forms/text_form_add.dart';
import 'package:oeh/models/pubs_list.dart';
import 'package:oeh/utils/app_routes.dart';
import 'package:provider/provider.dart';
import '../../core/assets.dart';

class TwoCreatePub extends StatefulWidget {
  const TwoCreatePub({super.key});

  @override
  State<TwoCreatePub> createState() => _TwoCreatePubState();
}

class _TwoCreatePubState extends State<TwoCreatePub> {
  late Map<String, Object> registerPub;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      registerPub =
          ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    });
  }

  final _formData = Map<String, Object>();

  final _formKey = GlobalKey<FormState>();
  final _stateController = TextEditingController();
  final _cepController = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Provider.of<PubsList>(context, listen: false).addPubData(_formData);
      Navigator.of(context).pushReplacementNamed(AppRoutes.PUB_OVERVIEW);
    }
  }

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
                        _stateController, 'Estado', _formData, 'state'),
                    TextFormFieldAdd(_cepController, 'CEP', _formData, 'cep'),
                    TextFormFieldAdd(
                        _cityController, 'Cidade', _formData, 'city'),
                    TextFormFieldAdd(
                        _districtController, 'Bairro', _formData, 'district'),
                    TextFormFieldAdd(
                        _streetController, 'Rua', _formData, 'street'),
                    NumberFormFieldAdd(
                        _numberController, 'Número', _formData, 'number'),
                    TextFormFieldAdd(
                        _latitudeController, 'Latitude', _formData, 'latitude'),
                    TextFormFieldAdd(_longitudeController, 'Longitude',
                        _formData, 'longitude'),
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
