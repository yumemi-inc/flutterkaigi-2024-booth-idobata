import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/slide_show/slide_data.dart';

final allSlidesProvider = Provider<List<SlideData>>((ref) {
  return const [
    VideoData(
      id: '970a57d7-d863-41ea-8df6-d42f44b828d6',
      title: 'テンプレートプロジェクト CM',
      assetPath: 'assets/commercial.mp4',
    ),
    TalkData(
      id: 'd6ad29e7-0931-464e-85fd-da01c3caa79a',
      title: 'テンプレートプロジェクトについて',
      overview: 'テンプレートプロジェクトについて何でもお話します！',
      talker: 'blendthink',
      talkerIconAssetPath: 'assets/blendthink.png',
      talkTimeMinutes: 10,
    ),
  ];
});
