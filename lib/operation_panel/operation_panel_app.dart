import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:idobata/operation_panel/screen/operation_panel_screen.dart';
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
            : OperationPanelScreen(windowId: windowId.value!),
      ),
    );
  }
}
