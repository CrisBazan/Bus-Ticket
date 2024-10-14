import 'package:bus_ticket/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TopInformation extends StatelessWidget {
  const TopInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: size.height * 0.27,
      width: double.infinity,
      color: const Color(0xffff5959),
      child: const Center(child: Saldo()),
    );
  }
}
