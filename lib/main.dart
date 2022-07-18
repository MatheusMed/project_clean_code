import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:project_clean_code/src/modules/post/user_module.dart';

void main() {
  runApp(
    ModularApp(
      module: UserModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
