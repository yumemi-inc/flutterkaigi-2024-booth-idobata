import 'dart:async';

import 'package:flutter/material.dart';
import 'package:window_manager_plus/window_manager_plus.dart';

class OperationPanelApp extends StatelessWidget {
  const OperationPanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () async {
              unawaited(
                WindowManagerPlus.createWindow(),
              );
            },
            child: const Text('操作パネル'),
          ),
        ),
      ),
    );
  }
}
