import 'package:bot_toast/bot_toast.dart';
import 'package:event_managemenet/app/globals.dart';
import 'package:event_managemenet/app/palette.dart';
import 'package:event_managemenet/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class EventManagementApp extends StatefulWidget {
  const EventManagementApp({Key? key}) : super(key: key);

  @override
  EventManagementAppState createState() => EventManagementAppState();
}

class EventManagementAppState extends State<EventManagementApp> {
  @override
  void initState() {
    super.initState();
    initSetup();
  }

  void initSetup() async {}

  @override
  void dispose() {
    super.dispose();
  }

  Widget myBuilder(BuildContext context, Widget child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return MultiBlocProvider(
      providers: [

      ],
      child: MultiProvider(
        providers: [

        ],
        child: MaterialApp(
          title: "Si Eclipse",
          scrollBehavior: ScrollConfiguration.of(context).copyWith(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
          ),
          debugShowCheckedModeBanner: false,
          theme: Palette.lightTheme,
          darkTheme: Palette.darkTheme,
          themeMode: ThemeMode.light,
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          builder: (context, child) {
            screenWidth = MediaQuery.of(context).size.width;
            screenHeight = MediaQuery.of(context).size.height;
            child = myBuilder(context, child!); //do something
            child = botToastBuilder(context, child);
            SystemChrome.setSystemUIOverlayStyle(context.isDark
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark);
            return child;
          },
          home: const PreLoader(),
        ),
      ),
    );
  }
}

class PreLoader extends StatefulWidget {
  const PreLoader({Key? key}) : super(key: key);

  @override
  PreLoaderState createState() => PreLoaderState();
}

class PreLoaderState extends State<PreLoader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
