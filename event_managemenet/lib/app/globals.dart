import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_platform/universal_platform.dart';

final bool kIsWeb = UniversalPlatform.isWeb;
final bool isIos = UniversalPlatform.isIOS;
final bool isAndroid = UniversalPlatform.isAndroid;
final bool isMacOS = UniversalPlatform.isMacOS;
final bool isWindow = UniversalPlatform.isWindows;
final bool isFuchsia = UniversalPlatform.isFuchsia;
final bool isMobile = UniversalPlatform.isIOS || UniversalPlatform.isAndroid;
final bool isDesktop = UniversalPlatform.isMacOS || UniversalPlatform.isWindows;

const NA = "NA";

double screenWidth = 0.0;
double screenHeight = 0.0;

/// Border Radius
double BR10 = 10;
double BR20 = 20;
double BR40 = 40;
double BR5 = 5;

late SharedPreferences sharedPref;

String somethingWentWrongM = "Oops something went wrong, please try again later";

bool isEmulator = false;



// void somethingWentWrong() {
//   showNotification(somethingWentWrongM);
// }
//
// void noInternet() {
//   showNotification("No internet!");
// }

void showLog(dynamic msg) {
  if (!kDebugMode) return;
  debugPrintThrottled(msg.toString(), wrapWidth: 200);
}

void hideKeyboard([BuildContext? context]) {
  if (context != null) {
    FocusScope.of(context).unfocus();
    FocusScope.of(context).requestFocus(FocusNode());
  }
  SystemChannels.textInput.invokeMethod<String>('TextInput.hide');
}

void safeSetState(VoidCallback onComplete) {
  WidgetsBinding.instance.addPostFrameCallback((timestamp) {
    onComplete();
  });
}
