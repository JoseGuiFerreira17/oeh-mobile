import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oeh/components/forms/number_form_add.dart';
import 'package:oeh/components/forms/text_form_add.dart';
import 'package:oeh/components/forms/url_form_add.dart';
import 'package:oeh/models/event.dart';
import 'package:oeh/models/events_list.dart';
import 'package:provider/provider.dart';
import '../core/assets.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
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
  final _stateController = TextEditingController();
  final _cepController = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  void _submitForm() {
    _formData['date'] = _selectedDate;
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Provider.of<EventsList>(context, listen: false).addEventData(_formData);
      createSuccess;
      Navigator.of(context).pop();
    }
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    ).then((value) => {
          if (value != null)
            {
              setState(() {
                _selectedDate = value;
              })
            }
        });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final event = ModalRoute.of(context)?.settings.arguments as Event?;
      if (event != null) {
        _formData['id'] = event.id;
        _formData['name'] = event.name;
        _formData['phone'] = event.phone;
        _formData['description'] = event.description;
        _formData['image'] = event.imageUrl!;
        _formData['date'] = event.date!;
        _formData['state'] = event.state;
        _formData['cep'] = event.cep;
        _formData['city'] = event.city;
        _formData['district'] = event.district;
        _formData['street'] = event.street;
        _formData['number'] = event.number!;
        _formData['latitude'] = event.latitude!;
        _formData['longitude'] = event.longitude!;
        _nameController.text = event.name;
        _phoneController.text = event.phone;
        _descriptionController.text = event.description;
        _imageController.text = event.imageUrl!;
        _stateController.text = event.state;
        _cepController.text = event.cep;
        _cityController.text = event.city;
        _districtController.text = event.district;
        _streetController.text = event.street;
        _numberController.text = event.number.toString();
        _latitudeController.text = event.latitude!;
        _longitudeController.text = event.longitude!;
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
                      height: 70,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _selectedDate == null
                                  ? 'Nenhuma data selecionada'
                                  : 'Data selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.purple)),
                            onPressed: _showDatePicker,
                            child: const Text(
                              'Selecionar data',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
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
