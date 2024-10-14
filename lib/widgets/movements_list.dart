import 'package:bus_ticket/providers/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovementsList extends StatelessWidget {
  final String tipo;
  const MovementsList({
    super.key,
    required this.tipo,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ticketsListProvider =
        Provider.of<TicketProvider>(context, listen: true);
    final tickets = ticketsListProvider.tickets;
    ticketsListProvider.cargarTickets();

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: size.height * 0.596),
        child: ListView.builder(
          itemCount: tickets.length,
          itemBuilder: (_, i) => ListTile(
            title: Text(tickets[i].tipo,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size.width * 0.06)),
            tileColor: const Color(0xff49beb7),
            leading: Icon(
                tickets[i].tipo == 'Recarga'
                    ? Icons.attach_money_sharp
                    : Icons.directions_bus_filled_outlined,
                color: const Color(0xff085f63),
                size: size.height * 0.06),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tickets[i].tipo == 'Recarga'
                      ? '\$ +${tickets[i].valor.toString()}'
                      : '\$ -${tickets[i].valor.toString()}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  tickets[i].fecha.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            contentPadding: EdgeInsets.all(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}

class _OtroListView extends StatelessWidget {
  const _OtroListView();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        color: Color(0xff49beb7),
      ),
      itemBuilder: (context, index) => ListTile(
        tileColor: const Color(0xff49beb7),
        title: Row(
          children: [
            Icon(
              Icons.attach_money_sharp,
              size: size.height * 0.06,
            ),
            Column(
              children: [
                Text(
                  'Recarga',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: size.width * 0.06),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '14/10',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.05),
            ),
            Text(
              '\$450',
              style: TextStyle(fontSize: size.width * 0.05),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
