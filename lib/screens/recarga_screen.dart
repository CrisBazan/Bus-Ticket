import 'package:bus_ticket/preferences/preferences.dart';
import 'package:bus_ticket/providers/list_provider.dart';
import 'package:bus_ticket/ui.dart';
import 'package:bus_ticket/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RecargaScreen extends StatefulWidget {
  const RecargaScreen({super.key});

  @override
  State<RecargaScreen> createState() => _RecargaScreenState();
}

class _RecargaScreenState extends State<RecargaScreen> {
  late String _value;
  late double? see = 0;
  @override
  Widget build(BuildContext context) {
    String _value = '0';
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
      body: CustomScrollView(slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          const TopTitle(
            string: 'Recarga',
            icon: Icons.attach_money_sharp,
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            width: double.infinity,
            height: size.height * 0.1,
            color: const Color(0xff49beb7),
            child: Form(
                child: TextFormField(
              validator: (value) {
                if (value!.isEmpty ||
                    int.tryParse(value) == null ||
                    value == '.') {
                  return 'Ingresar solo valores numericos';
                }
              },
              onChanged: (value) {
                _value = value;
              },
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
          ),
          SizedBox(height: size.height * 0.03),
          Center(
            child: Container(
              height: see,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.005),
              decoration: BoxDecoration(
                  color: const Color(0xffff5959),
                  borderRadius: BorderRadius.circular(25)),
              child: const Text(
                'Tu saldo ha sido actualizado!',
                style: TextStyle(color: Color(0xfffacf5a)),
              ),
            ),
          )
        ]))
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: const Color(0xff49beb7),
        onPressed: () async {
          if (_value == '0') {
            return;
          } else {
            print('${DateTime.now().day}/${DateTime.now().month}');
            _value = double.parse(_value).toStringAsFixed(2);
            FocusScope.of(context).requestFocus(FocusNode());
            see = null;
            await Future.delayed(const Duration(seconds: 2));
            see = 0;
            Preferences.saldo = Preferences.saldo + double.parse(_value);
            final nuevoTicket = await ticketProvider.nuevoTicket(_value,
                'Recarga', '${DateTime.now().day}/${DateTime.now().month}');
            if (!mounted) {
              return;
            }
            setState(
              () {},
            );
          }
        },
        child: const Icon(
          Icons.check,
          color: Color(0xff085f63),
        ),
      ),
    );
  }
}
