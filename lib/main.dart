import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:studioprojects/classes/taskdonot.dart';
import 'package:studioprojects/sayfalar/HomePage.dart';
import 'package:studioprojects/sayfalar/actions/showing_task.dart';
import 'package:studioprojects/classes/taskdo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter<TaskDo>(TaskAdapter());
  Hive.registerAdapter<TaskDoNot>(TaskNoAdapter());
  await Hive.openBox<TaskDo>("taskDo");
  print("kutu do acildi ");
  await Hive.openBox<TaskDoNot>("taskDoNot");
  print("kutu do not acildi");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("main");
    WidgetsApp.debugAllowBannerOverride= false;
    return MaterialApp(
      title: "DOs and DONTs",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const HomePage()
    );
  }
}



