import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/slide_show/slide_data.dart';
import 'package:idobata/util/video_player_controller_hook.dart';
import 'package:video_player/video_player.dart';

class VideoSlideScreen extends HookConsumerWidget {
  const VideoSlideScreen({
    required VideoData data,
    super.key,
  }) : _data = data;

  final VideoData _data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useVideoPlayerController.asset(_data.assetPath);
    final initialized = useState(controller.value.isInitialized);
    final isPlaying = useState(controller.value.isPlaying);

    useEffect(
      () {
        void listener() {
          initialized.value = controller.value.isInitialized;
          isPlaying.value = controller.value.isPlaying;
        }

        controller.addListener(listener);

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await controller.initialize();
        });
        return () {
          controller.removeListener(listener);
          unawaited(controller.dispose());
        };
      },
      [],
    );
    return Scaffold(
      body: Center(
        child: initialized.value
            ? AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isPlaying.value
              ? unawaited(controller.pause())
              : unawaited(controller.play());
        },
        child: Icon(
          isPlaying.value ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}