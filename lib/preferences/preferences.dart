import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static double _price = 1;
  static double _saldo = 0;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static double get price {
    return _prefs.getDouble('price') ?? _price;
  }

  static set price(double price) {
    _price = price;
    _prefs.setDouble('price', price);
  }

  static double get saldo {
    return _prefs.getDouble('saldo') ?? _saldo;
  }

  static set saldo(double saldo) {
    _saldo = saldo;
    _prefs.setDouble('saldo', saldo);
  }
}
