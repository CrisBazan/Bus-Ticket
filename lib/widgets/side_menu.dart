import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Drawer(
        backgroundColor: const Color(0xff085f63),
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                color: const Color(0xffff5959),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff085f63),
                          borderRadius: BorderRadius.circular(25)),
                      child: Icon(Icons.directions_bus_filled_outlined,
                          size: size.width * 0.09,
                          color: const Color(0xff49beb7)),
                    ),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      'Bus Ticket',
                      style: TextStyle(
                          fontSize: (size.width / 2) * 0.135,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
          Container(
            color: const Color(0xff49beb7),
            child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: const Color(0xff085f63),
                  size: size.width * 0.07,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: size.width * 0.045),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'home');
                }),
          ),
          Divider(
            height: size.height * 0.01,
            color: Colors.black38,
            thickness: 5,
          ),
          Container(
            color: const Color(0xff49beb7),
            child: ListTile(
                leading: Icon(
                  Icons.attach_money_sharp,
                  color: const Color(0xff085f63),
                  size: size.width * 0.07,
                ),
                title: Text(
                  'Recarga',
                  style: TextStyle(fontSize: size.width * 0.045),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'recarga');
                }),
          ),
          Divider(
            height: size.height * 0.01,
            color: Colors.black38,
            thickness: 5,
          ),
          Container(
            color: const Color(0xff49beb7),
            child: ListTile(
                leading: Icon(
                  Icons.directions_bus_filled_outlined,
                  color: const Color(0xff085f63),
                  size: size.width * 0.07,
                ),
                title: Text(
                  'Viaje',
                  style: TextStyle(fontSize: size.width * 0.045),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'viaje');
                }),
          ),
          Divider(
            height: size.height * 0.01,
            color: Colors.black38,
            thickness: 5,
          ),
          Container(
            color: const Color(0xff49beb7),
            child: ListTile(
                leading: Icon(
                  Icons.settings_outlined,
                  color: const Color(0xff085f63),
                  size: size.width * 0.07,
                ),
                title: Text(
                  'Configuraciones',
                  style: TextStyle(fontSize: size.width * 0.045),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'settings');
                }),
          ),
          const Text('CHB')
        ]));
  }
}
