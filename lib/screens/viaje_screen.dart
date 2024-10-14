import 'package:bus_ticket/preferences/preferences.dart';
import 'package:bus_ticket/providers/list_provider.dart';
import 'package:bus_ticket/ui.dart';
import 'package:bus_ticket/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ViajeScreen extends StatefulWidget {
  const ViajeScreen({super.key});

  @override
  State<ViajeScreen> createState() => _ViajeScreenState();
}

class _ViajeScreenState extends State<ViajeScreen> {
  late String _value;
  late double? see = 0;
  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context, listen: false);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff085f63),
      appBar: AppBar(
        backgroundColor: const Color(0xff085f63),
        title: const Text('Bus Ticket'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            const TopTitle(
              string: 'Viaje',
              icon: Icons.directions_bus_filled_outlined,
            ),
            SizedBox(height: size.height * 0.03),
            TextButton(
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Preferences.saldo = Preferences.saldo - Preferences.price;
                  final nuevoTicket = await ticketProvider.nuevoTicket(
                      Preferences.price.toStringAsFixed(2),
                      'Viaje',
                      '${DateTime.now().day}/${DateTime.now().month}');
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    see = size.height * 0.045;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() {
                    see = 0;
                  });
                },
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.07,
                        vertical: size.height * 0.01),
                    decoration: BoxDecoration(
                        color: const Color(0xffff5959),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_bus_filled_outlined,
                          color: Color(0xff085f63),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Cargar viaje',
                          style: TextStyle(
                              fontSize: size.height * 0.022,
                              color: Color(0xff085f63)),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.directions_bus_filled_outlined,
                          color: Color(0xff085f63),
                        ),
                      ],
                    ))),
            SizedBox(height: size.height * 0.03),
            Center(
                child: Text(
              'Has cargado un viaje!',
              style: TextStyle(
                  color: const Color(0xffff5959),
                  fontWeight: FontWeight.bold,
                  fontSize: see),
            )),
          ]))
        ],
      ),

      // Container(
      //         margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      //         decoration: BoxDecoration(
      //             color: const Color(0xffff5959),
      //             borderRadius: BorderRadius.circular(25)),

      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   elevation: 2,
      //   backgroundColor: const Color(0xff49beb7),
      //   onPressed: () async {
      //     FocusScope.of(context).requestFocus(FocusNode());
      //     see = null;
      //     await Future.delayed(const Duration(seconds: 2));
      //     see = 0;
      //     Preferences.saldo = Preferences.saldo - double.parse(_value);
      //     final nuevoTicket = await ticketProvider.nuevoTicket(_value, 'Viaje');
      //     if (!mounted) {
      //       return;
      //     }
      //     setState(
      //       () {},
      //     );
      //   },
      //   child: const Icon(
      //     Icons.check,
      //     color: Color(0xff085f63),
      //   ),
      // ),
    );
  }
}
