import 'package:flutter/material.dart';
import 'package:bus_ticket/preferences/preferences.dart';

class Saldo extends StatefulWidget {
  const Saldo({
    super.key,
  });

  @override
  State<Saldo> createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Tu saldo',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.07,
              color: const Color(0xfffacf5a)),
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xff085f63)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text('\$ ${Preferences.saldo.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: size.height * 0.07,
                    color: const Color(0xfffacf5a)))),
      ],
    );
  }
}
