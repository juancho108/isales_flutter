import 'package:agenda/data/occurrences_providers.dart';
import 'package:agenda/data/db_util.dart';
import 'package:agenda/models/activity.dart';
import 'package:agenda/screens/screens.dart';
import 'package:agenda/share_prefs/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();

    return ChangeNotifierProvider(
      create: (ctx) => OccurrencesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Agenda',
        theme: ThemeData(
          primaryColor: Color(0xff9CBE00),
          // canvasColor: const Color(0xffE7E4DB),
        ),
        routes: {
          "home": (_) => HomePage(),
          "licence": (_) => LicencePage(),
          "login": (_) => LoginPage(),
        },
        initialRoute: prefs.configured ? 'login' : 'licence',
        // initialRoute: 'login',
      ),
    );
  }
}
