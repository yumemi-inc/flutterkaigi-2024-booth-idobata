import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/data/video_event.dart';

final videoEventProvider = NotifierProvider<VideoEventNotifier, VideoEvent?>(
  VideoEventNotifier.new,
);

class VideoEventNotifier extends Notifier<VideoEvent?> {
  @override
  VideoEvent? build() {
    return null;
  }

  void play() {
    state = VideoEvent.play;
  }

  void pause() {
    state = VideoEvent.pause;
  }
}
