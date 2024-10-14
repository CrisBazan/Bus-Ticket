import 'dart:io';
import 'package:bus_ticket/models/ticket_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    //Path del almacenamiento de la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'bus_ticket_database.db');
    print(path);

    //Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE BusTicket(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT,
          fecha TEXT
        )
        ''');
      },
    );
  }

  Future<int> nuevoTicket(Ticket ticket) async {
    final db = await database;
    final res = await db!.insert('BusTicket', ticket.toJson());
    //'res' es el ID del ultimo registro insertado
    return res;
  }

  Future<List<Ticket>> getTodosLosTickets() async {
    final db = await database;
    final res = await db!.query('BusTicket');

    return res.isNotEmpty ? res.map((s) => Ticket.fromJson(s)).toList() : [];
  }

  Future<int> updateTicket(Ticket ticket) async {
    final db = await database;
    final res = await db!.update('BusTicket', ticket.toJson(),
        where: 'id = ?', whereArgs: [ticket.id]);
    return res;
  }

  Future<int> deleteAllTickets() async {
    final db = await database;
    final res = await db!.rawDelete('''
      DELETE FROM BusTicket
    ''');
    return res;
  }
}
