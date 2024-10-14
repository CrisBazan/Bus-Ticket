import 'package:bus_ticket/models/dates_models.dart';
import 'package:flutter/material.dart';
import 'package:bus_ticket/models/ticket_model.dart';

class TicketProvider extends ChangeNotifier {
  List<Ticket> tickets = [];

  Future<Ticket> nuevoTicket(String valor, String tipo, String fecha) async {
    final nuevoTicket = Ticket(valor: valor, tipo: tipo, fecha: fecha);
    final id = await DBProvider.db.nuevoTicket(nuevoTicket);
    //Asignar el ID de la bvase de datos al modelo
    nuevoTicket.id = id;
    tickets.add(nuevoTicket);
    notifyListeners();
    return nuevoTicket;
  }

  cargarTickets() async {
    final tickets = await DBProvider.db.getTodosLosTickets();
    this.tickets = [...tickets];
    this.tickets = List.from(tickets.reversed);
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllTickets();
    tickets = [];
    notifyListeners();
  }
}
