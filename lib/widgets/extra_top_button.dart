import 'package:flutter/material.dart';

class ExtraTopButton extends StatelessWidget {
  final IconData icon;
  final String string;
  final String route;

  const ExtraTopButton({
    super.key,
    required this.icon,
    required this.string,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, route);
          },
          icon: CircleAvatar(
              backgroundColor: const Color(0xff085f63),
              child: Icon(icon, size: size.width * 0.08)),
        ),
        Text(string, style: TextStyle(fontSize: size.width * 0.05))
      ],
    );
  }
}
