import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String string;
  final IconData icon;
  const TopTitle({super.key, required this.string, required this.icon});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(top: 10),
        height: size.height * 0.27,
        width: double.infinity,
        color: const Color(0xffff5959),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xff085f63),
                    borderRadius: BorderRadius.circular(25)),
                child: Icon(
                  icon,
                  size: size.height * 0.065,
                  color: const Color(0xff49beb7),
                ),
              ),
              SizedBox(width: size.width * 0.03),
              Text(
                string,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.07,
                    color: const Color(0xfffacf5a)),
              ),
            ])));
  }
}
