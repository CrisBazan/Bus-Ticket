import 'package:bus_ticket/preferences/preferences.dart';
import 'package:bus_ticket/providers/list_provider.dart';
import 'package:bus_ticket/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TicketProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bus ticket',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'recarga': (_) => const RecargaScreen(),
          'viaje': (_) => const ViajeScreen(),
          'settings': (_) => const SettingsScreen(),
        },
      ),
    );
  }
}
