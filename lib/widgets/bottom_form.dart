import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bus_ticket/ui.dart';

class BottomForm extends StatelessWidget {
  const BottomForm({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.1,
      color: const Color(0xff49beb7),
      child: Form(
          child: TextFormField(
        onChanged: (value) {},
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
        ],
        keyboardType: TextInputType.number,
        decoration: InputDecorations.authInputDecoration(
            hintText: 'ej. 150',
            labelText: 'Monto: ',
            prefixIcon: Icons.attach_money_sharp,
            size: size.height * 0.05),
      )),
    );
  }
}
