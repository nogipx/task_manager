import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simpledo/di.dart';
import 'package:simpledo/screens/main_screen.dart';

Future<void> main() async {
  unawaited(SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    // iOS
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.light,

    // Android
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(
    () async {
      final app = Injector(
        child: const MainScreen(),
      );
      await app.init();
      runApp(MaterialApp(
        home: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: app,
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.light(),
        ),
      ));
    },
    (error, stackTrace) {},
  );
}
