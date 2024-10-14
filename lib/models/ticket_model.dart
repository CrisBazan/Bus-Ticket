import 'dart:convert';

Ticket ticketFromJson(String str) => Ticket.fromJson(json.decode(str));

String ticketToJson(Ticket data) => json.encode(data.toJson());

class Ticket {
  Ticket({
    this.id,
    required this.tipo,
    required this.valor,
    required this.fecha,
  });

  int? id;
  String tipo;
  String valor;
  String fecha;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
        "fecha": fecha,
      };
}
