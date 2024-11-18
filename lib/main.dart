import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:idobata/operation_panel/operation_panel_app.dart';
import 'package:idobata/slide_show/slide_show_app.dart';
import 'package:window_manager_plus/window_manager_plus.dart';
import 'package:window_size/window_size.dart';

const _operationPanelAppWindowId = 0;

Future<void> main(List<String> args) async {
  if (kIsWeb || !Platform.isMacOS) {
    throw UnsupportedError('This platform is not supported');
  }

  WidgetsFlutterBinding.ensureInitialized();

  final windowId = args.isEmpty
      ? _operationPanelAppWindowId
      : int.tryParse(args[0]) ?? _operationPanelAppWindowId;

  await WindowManagerPlus.ensureInitialized(windowId);
  setWindowMinSize(const Size(640, 360));

  const windowOptions = WindowOptions(
    size: Size(640, 360),
    center: true,
  );
  unawaited(
    WindowManagerPlus.current.waitUntilReadyToShow(windowOptions, () async {
      await WindowManagerPlus.current.show();
      await WindowManagerPlus.current.focus();
    }),
  );

  final app = switch (windowId) {
    _operationPanelAppWindowId => const OperationPanelApp(),
    _ => const SlideShowApp(),
  };

  runApp(app);
}
