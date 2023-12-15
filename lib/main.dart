import 'package:flutter/material.dart';
import 'package:tugas6hive/model/person.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/info_screens.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(PersonAdapter());

  await Hive.openBox('peopleBox');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: InfoScreen(),
    );
  }
}
