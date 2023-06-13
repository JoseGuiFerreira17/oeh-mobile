// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:oeh/components/forms/number_form_add.dart';
import 'package:oeh/components/forms/text_form_add.dart';
import 'package:oeh/components/forms/url_form_add.dart';
import 'package:oeh/models/pub.dart';
import 'package:oeh/models/pubs_list.dart';
import 'package:provider/provider.dart';
import '../core/assets.dart';

class CreatePub extends StatefulWidget {
  const CreatePub({super.key});

  @override
  State<CreatePub> createState() => _CreatePubState();
}

class _CreatePubState extends State<CreatePub> {
  final _formData = Map<String, Object>();

  final createSuccess = const SnackBar(
    content: Text(
      "Cadatro realizado com sucesso",
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.green,
  );

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();
  final _opennigTimeController = TextEditingController();
  final _closingTimeController = TextEditingController();
  final _stateController = TextEditingController();
  final _cepController = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  bool _isLoading = false;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Provider.of<PubsList>(context, listen: false).addPubData(_formData);
      createSuccess;
      Navigator.of(context).pop();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final pub = ModalRoute.of(context)?.settings.arguments as Pub?;
      if (pub != null) {
        _formData['id'] = pub.id;
        _formData['name'] = pub.name;
        _formData['phone'] = pub.phone;
        _formData['description'] = pub.description;
        _formData['image'] = pub.imageUrl!;
        _formData['openingTime'] = pub.opennigTime;
        _formData['closingTime'] = pub.closingTime;
        _formData['state'] = pub.state;
        _formData['cep'] = pub.cep;
        _formData['city'] = pub.city;
        _formData['district'] = pub.district;
        _formData['street'] = pub.street;
        _formData['number'] = pub.number!;
        _formData['latitude'] = pub.latitude!;
        _formData['longitude'] = pub.longitude!;
        _nameController.text = pub.name;
        _phoneController.text = pub.phone;
        _descriptionController.text = pub.description;
        _imageController.text = pub.imageUrl!;
        _opennigTimeController.text = pub.opennigTime;
        _closingTimeController.text = pub.closingTime;
        _stateController.text = pub.state;
        _cepController.text = pub.cep;
        _cityController.text = pub.city;
        _districtController.text = pub.district;
        _streetController.text = pub.street;
        _numberController.text = pub.number.toString();
        _latitudeController.text = pub.latitude!;
        _longitudeController.text = pub.longitude!;
      }
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
