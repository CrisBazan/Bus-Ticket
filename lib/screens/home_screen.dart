import 'package:bus_ticket/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
            const TopInformation(),
            Container(
              padding: EdgeInsets.all(8),
              color: const Color(0xff085f63),
              child: Text(
                'Historial:',
                style: TextStyle(
                    color: Color(0xfffacf5a),
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.02),
              ),
            ),
            const MovementsList(
              tipo: 'Recarga',
            ),
          ]))
        ],
      ),
    );
  }
}
