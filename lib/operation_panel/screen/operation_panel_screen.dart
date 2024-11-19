import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/data/all_slides_provider.dart';
import 'package:idobata/data/operation_event.dart';
import 'package:idobata/slide_show/slide_data.dart';
import 'package:window_manager_plus/window_manager_plus.dart';

late Timer? _timer;

class OperationPanelScreen extends HookConsumerWidget {
  const OperationPanelScreen({required int windowId, super.key})
      : _windowId = windowId;

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
