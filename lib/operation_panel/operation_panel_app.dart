import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/data/all_slides_provider.dart';
import 'package:idobata/data/operation_event.dart';
import 'package:idobata/slide_show/slide_data.dart';
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

late Timer? _timer;

class _OperationPanel extends HookConsumerWidget {
  const _OperationPanel({required int windowId}) : _windowId = windowId;

  final int _windowId;

  Future<void> _goToSlide(
    ValueNotifier<SlideData> selectedSlide,
    SlideData slide,
  ) async {
    _timer?.cancel();
    await WindowManagerPlus.current.invokeMethodToWindow(
      _windowId,
      OperationEvent.go.name,
      slide.path,
    );
    selectedSlide.value = slide;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slides = ref.watch(allSlidesProvider);
    final selectedSlide = useState<SlideData>(slides.first);
    final enableSlideShow = useState(true);

    useEffect(
      () {
        if (!enableSlideShow.value) {
          return null;
        }

        _timer = Timer.periodic(
          Duration(seconds: selectedSlide.value.slideChangeSeconds),
          (_) {
            final currentIndex = slides.indexOf(selectedSlide.value);
            final nextIndex = (currentIndex + 1) % slides.length;
            final nextSlide = slides[nextIndex];
            unawaited(
              _goToSlide(selectedSlide, nextSlide),
            );
          },
        );

        return _timer?.cancel;
      },
      [selectedSlide.value, enableSlideShow.value],
    );

    return Center(
      child: TextButton(
        onPressed: () {
          unawaited(
            _goToSlide(selectedSlide, slides.last),
          );
        },
        child: const Text('OperationPanel'),
      ),
    );
  }
}
