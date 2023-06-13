// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, empty_constructor_bodies
import 'package:flutter/material.dart';

import '../../core/assets.dart';

class UrlFormFieldAdd extends StatelessWidget {
  final TextEditingController _controller;
  final Map<String, Object> _formData;
  final String _attribute;
  final String _label;

  UrlFormFieldAdd(
      this._controller, this._label, this._formData, this._attribute);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
              labelText: _label,
              labelStyle: TextStyle(
                color: OEHColors.oehPurple,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: OEHColors.oehPurple),
                  borderRadius: BorderRadius.circular(20))),
          keyboardType: TextInputType.url,
          controller: _controller,
          onSaved: (value) => _formData[_attribute] = value ?? '',
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
