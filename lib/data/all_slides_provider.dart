import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/slide_show/slide_data.dart';

final allSlidesProvider = Provider<List<SlideData>>((ref) {
  return const [
    VideoData(
      id: 'video',
      title: 'テンプレートプロジェクト CM',
      assetPath: 'assets/commercial.mp4',
    ),
    TalkData(
      id: 'talk',
      title: 'テンプレートプロジェクトについて',
      overview: 'テンプレートプロジェクトについて何でもお話します！',
      talker: 'blendthink',
      talkerIconAssetPath: 'assets/blendthink.png',
      talkTimeMinutes: 10,
    ),
  ];
});
