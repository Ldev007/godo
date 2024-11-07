import 'package:flutter/material.dart';
import 'package:godo/core/router/router.dart';

class GodoApp extends StatefulWidget {
  const GodoApp({super.key});

  @override
  State<GodoApp> createState() => _GodoAppState();
}

class _GodoAppState extends State<GodoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
