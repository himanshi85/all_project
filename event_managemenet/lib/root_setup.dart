import 'package:event_managemenet/app/globals.dart';
import 'package:event_managemenet/event_management_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void runAtStartUp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  sharedPref = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const EventManagementApp());
}
