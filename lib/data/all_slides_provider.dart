import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/slide_show/slide_data.dart';

final allSlidesProvider = Provider<List<SlideData>>((ref) {
  const talks = [
    TalkData(
      id: 'd6ad29e7-0931-464e-85fd-da01c3caa79a',
      title: 'テンプレートプロジェクトについて',
      overview: 'テンプレートプロジェクトについて何でもお話します！',
      talker: 'blendthink',
      talkerImageAssetPath: 'assets/blendthink.png',
      talkTimeMinutes: 10,
    ),
    TalkData(
      id: 'ecbd2f12-6684-412f-80fc-bbc689e25894',
      title: 'melos でのマルチパッケージ構成とか説明',
      overview: 'マルチパッケージ構成でのハマりポイントなど',
      talker: 'blendthink',
      talkerImageAssetPath: 'assets/blendthink.png',
      talkTimeMinutes: 10,
    ),
    TalkData(
      id: '7b9d3b27-c775-4fdd-b0cc-44c225d54268',
      title: 'ゆめみの給与自己決定制度について実体験を基にせきららに話します。',
      overview: '''
ゆめみには「自分が会社に提供する価値を値決めして希望年収を提示をする」給与自己決定制度があります。

先日この制度を利用して昇給した体験を踏まえて、この制度の良いところと課題や今後の機会点について何でも話します。''',
      talker: 'blendthink',
      talkerImageAssetPath: 'assets/blendthink.png',
      talkTimeMinutes: 10,
    ),
  ];

  return const [
    TalksData(
      id: '44cc9f37-de10-4476-b458-cddb8939644b',
      title: 'トーク一覧',
      talks: talks,
    ),
    ...talks,
    VideoData(
      id: '970a57d7-d863-41ea-8df6-d42f44b828d6',
      title: 'テンプレートプロジェクト CM',
      assetPath: 'assets/commercial.mp4',
    ),
  ];
});
