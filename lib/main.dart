import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

void main() {
  if (kIsWeb || !Platform.isMacOS) {
    throw UnsupportedError('This platform is not supported');
  }

  WidgetsFlutterBinding.ensureInitialized();
  setWindowMinSize(const Size(640, 360));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
