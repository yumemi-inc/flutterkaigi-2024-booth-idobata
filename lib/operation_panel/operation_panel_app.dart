import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/data/operation_event.dart';
import 'package:window_manager_plus/window_manager_plus.dart';

class OperationPanelApp extends HookWidget {
  const OperationPanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    final windowId = useState<int?>(null);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: windowId.value == null
            ? Center(
                child: TextButton(
                  onPressed: () async {
                    final manager = await WindowManagerPlus.createWindow();
                    if (manager != null) {
                      windowId.value = manager.id;
                    }
                  },
                  child: const Text('スライドショーを開いて、操作を開始する'),
                ),
              )
            : _OperationPanel(windowId: windowId.value!),
      ),
    );
  }
}

class _OperationPanel extends HookConsumerWidget {
  const _OperationPanel({required int windowId}) : _windowId = windowId;

  final int _windowId;

  void _goToSlide(String slidePath) {
    unawaited(
      WindowManagerPlus.current.invokeMethodToWindow(
        _windowId,
        OperationEvent.go.name,
        slidePath,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('windowId: $_windowId');
    return Center(
      child: TextButton(
        onPressed: () {
          _goToSlide('/970a57d7-d863-41ea-8df6-d42f44b828d6');
        },
        child: const Text('OperationPanel'),
      ),
    );
  }
}
