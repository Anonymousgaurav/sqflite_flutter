import 'package:flutter/material.dart';
import 'package:ilaz/network/NetConfig.dart';
import 'package:ilaz/presentation/screens/HomeScreen.dart';
import 'package:ilaz/presentation/screens/UserDetailsScreen.dart';
import 'package:ilaz/utils/IlazRoutes.dart';
import 'package:ilaz/utils/theme.dart';

void main() {
  runApp(const IlazApp());
}

class IlazApp extends StatelessWidget {
  const IlazApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      checkerboardOffscreenLayers: false,
      checkerboardRasterCacheImages: false,
      debugShowCheckedModeBanner: NetConfig.env == Environments.DEV,
      title: 'Ilaz',
      theme: IlazAppTheme.theme,
      home: HomeScreen(),
      routes: {},
    );
  }
}
