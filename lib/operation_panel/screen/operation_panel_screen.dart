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

    return Row(
      children: [
        Expanded(
          child: Card(
            margin: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: slides.length,
              itemBuilder: (context, index) {
                final slide = slides[index];
                return ListTile(
                  leading: switch (slide) {
                    final TalkData talk => CircleAvatar(
                        backgroundImage: AssetImage(
                          talk.talkerImageAssetPath,
                        ),
                      ),
                    final TalksData _ => const CircleAvatar(
                        child: Icon(Icons.groups),
                      ),
                    final VideoData _ => const CircleAvatar(
                        child: Icon(Icons.live_tv),
                      ),
                  },
                  title: Text(slide.title),
                  selected: slide == selectedSlide.value,
                  onTap: () => unawaited(_goToSlide(selectedSlide, slide)),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SwitchListTile(
                    title: const Text('スライドショー'),
                    value: enableSlideShow.value,
                    onChanged: (value) => enableSlideShow.value = value,
                  ),
                  const SizedBox(height: 32),
                  if (selectedSlide.value is VideoData) ...[
                    const Text('動画コントロール'),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () {
                            enableSlideShow.value = false;
                            unawaited(
                              WindowManagerPlus.current.invokeMethodToWindow(
                                _windowId,
                                OperationEvent.playVideo.name,
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.pause),
                          onPressed: () {
                            enableSlideShow.value = false;
                            unawaited(
                              WindowManagerPlus.current.invokeMethodToWindow(
                                _windowId,
                                OperationEvent.pauseVideo.name,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
