import 'package:bus_ticket/preferences/preferences.dart';
import 'package:bus_ticket/providers/list_provider.dart';
import 'package:bus_ticket/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late double? see = 0;
  late String _value;
  late String _value1;
  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context, listen: false);
    final ticketsListProvider =
        Provider.of<TicketProvider>(context, listen: true);
    // final tickets = ticketsListProvider.tickets;
    // ticketsListProvider.borrarTodos();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff085f63),
        title: const Text('Configuraciones'),
        centerTitle: true,
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                keyboardType: TextInputType.number,
                initialValue: '${Preferences.price}',
                onChanged: (value) {
                  _value = value;
                },
                decoration: InputDecoration(
                    prefix: const Icon(Icons.attach_money_sharp),
                    suffix: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffff5959),
                          borderRadius: BorderRadius.circular(25)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_value == null) {
                                return;
                              } else {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                Preferences.price = double.parse(_value);
                              }
                            });
                          },
                          icon: const Icon(Icons.save)),
                    ),
                    labelText: 'Nuevo precio',
                    helperText: 'Actualizar precio del pasaje'),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.005),
                  decoration: BoxDecoration(
                      color: const Color(0xffff5959),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Valor actual del pasaje :'),
                      Text(
                        ' \$ ${Preferences.price}',
                        style: const TextStyle(color: Color(0xfffacf5a)),
                      )
                    ],
                  )),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                keyboardType: TextInputType.number,
                initialValue: '${Preferences.saldo}',
                onChanged: (value) {
                  _value1 = value;
                },
                decoration: InputDecoration(
                    prefix: const Icon(Icons.attach_money_sharp),
                    suffix: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffff5959),
                          borderRadius: BorderRadius.circular(25)),
                      child: IconButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (_value1 == null) {
                              return;
                            } else {
                              Preferences.saldo = double.parse(_value1);
                            }
                            setState(() {});
                          },
                          icon: const Icon(Icons.save)),
                    ),
                    labelText: 'Nuevo saldo',
                    helperText: 'Actualizar tu saldo'),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.005),
                  decoration: BoxDecoration(
                      color: const Color(0xffff5959),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Valor actual de tu saldo :'),
                      Text(
                        ' \$ ${Preferences.saldo}',
                        style: const TextStyle(color: Color(0xfffacf5a)),
                      )
                    ],
                  )),
              SizedBox(
                height: size.height * 0.1,
              ),
              TextButton(
                  onPressed: () async {
                    final nuevoTicket = await ticketProvider.borrarTodos();
                    if (!mounted) {
                      return;
                    }
                    setState(() {
                      see = size.height * 0.03;
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
                            Icons.delete_forever,
                            color: Color(0xff085f63),
                          ),
                          Text(
                            'Borrar historial',
                            style: TextStyle(
                                fontSize: size.height * 0.022,
                                color: Color(0xff085f63)),
                          )
                        ],
                      ))),
              SizedBox(height: size.height * 0.03),
              Center(
                child: Text(
                  'Tu historial ha sido borrado!',
                  style: TextStyle(
                      color: const Color(0xffff5959),
                      fontWeight: FontWeight.bold,
                      fontSize: see),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
