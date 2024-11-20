import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/slide_show/slide_data.dart';

final allSlidesProvider = Provider<List<SlideData>>((ref) {
  const talks = [
    TalkData(
      id: 'd6ad29e7-0931-464e-85fd-da01c3caa79a',
      title: 'ゆめみの給与自己決定制度について実体験を基にせきららに話します。',
      overview: '''
ゆめみには「自分が会社に提供する価値を値決めして希望年収を提示をする」給与自己決定制度があります。

先日この制度を利用して昇給した体験を踏まえて、この制度の良いところと課題や今後の機会点について何でも話します。''',
      talker: 'かましー',
      talkerImageAssetPath: 'assets/kamashi.png',
      talkTimeMinutes: 10,
    ),
    TalkData(
      id: 'ecbd2f12-6684-412f-80fc-bbc689e25894',
      title: 'リードエンジニアの業務は割に合う？このポジションで働くことで得られるものは何？',
      overview: '''
若手エンジニアからリードエンジニアの業務は割に合うのかどうかを聞かれます。

リードエンジニアのポジションで働くことで得られることについて話しましょう！''',
      talker: 'かましー',
      talkerImageAssetPath: 'assets/kamashi.png',
      talkTimeMinutes: 10,
    ),
    TalkData(
      id: '7b9d3b27-c775-4fdd-b0cc-44c225d54268',
      title: '【Flutter CI/CD情報局】「わからないのでお聞かせください」',
      overview: '''
FlutterのCI/CDをあまり知らないので、手法や気をつけるべきことなど教えてください！
聞いた内容を蓄積していって次に訪れた方に共有します。''',
      talker: 'やまぱん',
      talkerImageAssetPath: 'assets/yamapan.png',
      talkTimeMinutes: 5,
    ),
    TalkData(
      id: 'fa0f5d52-30b3-4ead-a782-5eb7c5452e12',
      title: 'Flutter アプリ開発で生成AIを使うためには',
      overview:
          '''Flutterアプリ開発において生成AIを使いたい場合に、注意するべき点やオススメの手法についてお話ししましょう！生成AI自体の評価についてもお話できます''',
      talker: 'むろやまん',
      talkerImageAssetPath: 'assets/json.png',
      talkTimeMinutes: 5,
    ),
    TalkData(
      id: 'ad86e778-22e9-4cad-bf1d-da790ab69d80',
      title: 'ゆめみのテンプレートプロジェクトのプロジェクト構造について',
      overview:
          '''テンプレートプロジェクトではマルチパッケージ構成にしているのですが、ディレクトリ構造やパッケージごとの依存関係がどうなっているのかを詳しくお話しします！''',
      talker: 'おかやまん',
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
