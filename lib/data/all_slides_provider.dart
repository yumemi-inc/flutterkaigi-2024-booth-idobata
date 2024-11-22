import 'dart:math';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/slide_show/slide_data.dart';

final allSlidesProvider = Provider<List<SlideData>>((ref) {
  final talks = [
    const TalkData(
      id: 'd6ad29e7-0931-464e-85fd-da01c3caa79a',
      title: 'ゆめみの給与自己決定制度について実体験を基にせきららに話します。',
      overview: '''
ゆめみには「自分が会社に提供する価値を値決めして希望年収を提示をする」給与自己決定制度があります。

先日この制度を利用して昇給した体験を踏まえて、この制度の良いところと課題や今後の機会点について何でも話します。''',
      talker: 'かましー',
      talkerImageAssetPath: 'assets/kamashi.png',
      talkTimeMinutes: 10,
    ),
    const TalkData(
      id: 'ecbd2f12-6684-412f-80fc-bbc689e25894',
      title: 'リードエンジニアの業務は割に合う？このポジションで働くことで得られるものは何？',
      overview: '''
若手エンジニアからリードエンジニアの業務は割に合うのかどうかを聞かれます。

リードエンジニアのポジションで働くことで得られることについて話しましょう！''',
      talker: 'かましー',
      talkerImageAssetPath: 'assets/kamashi.png',
      talkTimeMinutes: 10,
    ),
    const TalkData(
      id: 'fa0f5d52-30b3-4ead-a782-5eb7c5452e12',
      title: 'Flutter アプリ開発で生成AIを使うためには',
      overview:
          '''Flutterアプリ開発において生成AIを使いたい場合に、注意するべき点やオススメの手法についてお話ししましょう！生成AI自体の評価についてもお話できます''',
      talker: 'むろやまん',
      talkerImageAssetPath: 'assets/json.png',
      talkTimeMinutes: 5,
    ),
    const TalkData(
      id: 'ad86e778-22e9-4cad-bf1d-da790ab69d80',
      title: 'ゆめみのテンプレートプロジェクトのプロジェクト構造について',
      overview:
          '''テンプレートプロジェクトではマルチパッケージ構成にしているのですが、ディレクトリ構造やパッケージごとの依存関係がどうなっているのかを詳しくお話しします！''',
      talker: 'おかやまん',
      talkerImageAssetPath: 'assets/blendthink.png',
      talkTimeMinutes: 10,
    ),
    const TalkData(
      id: '97035ca2-1826-4e02-8081-bfe26064f318',
      title: 'ゆめみのテンプレートプロジェクトのプロジェクト構造について',
      overview:
          '''テンプレートプロジェクトではマルチパッケージ構成にしているのですが、ディレクトリ構造やパッケージごとの依存関係がどうなっているのかを詳しくお話しします！''',
      talker: 'たっつー',
      talkerImageAssetPath: 'assets/tatsutakein.png',
      talkTimeMinutes: 10,
    ),
    const TalkData(
      id: '3c84f5e3-19c4-4abd-ad5f-45d14ce935a8',
      title: 'Melos の便利なところ',
      overview:
          '''Melos でのマルチパッケージ管理のメリットを紹介。SDK バージョンの統一管理、一括コマンド実行、フック機能による自動化など、効率的な開発環境構築方法について解説します。''',
      talker: 'おかやまん',
      talkerImageAssetPath: 'assets/blendthink.png',
      talkTimeMinutes: 5,
    ),
    const TalkData(
      id: '3847e6be-848f-45a2-bb8a-2d9b62f6b0ec',
      title: 'Melos の便利なところ',
      overview:
          '''Melos でのマルチパッケージ管理のメリットを紹介。SDK バージョンの統一管理、一括コマンド実行、フック機能による自動化など、効率的な開発環境構築方法について解説します。''',
      talker: 'たっつー',
      talkerImageAssetPath: 'assets/tatsutakein.png',
      talkTimeMinutes: 5,
    ),
    const TalkData(
      id: '3cc58d43-9a6c-4c77-ad58-a1092d93224b',
      title: '子育てエンジニアから見たゆめみってどう？',
      overview:
          '''仕事と育児を両立できるかどうかは会社の環境や文化にもよりますよね。ということで、育児関連のゆめみの制度などについて、2児の母から話します。単に育児関連の雑談もどうぞ。''',
      talker: 'あかつき',
      talkerImageAssetPath: 'assets/akatsuki.png',
      talkTimeMinutes: 5,
    ),
    const TalkData(
      id: '9c1331a7-5347-4fdf-a050-965e0aaa72c2',
      title: 'ゆめみと勉強会一緒にやりたい会社さんいますか？？',
      overview:
          '''ゆめみではconnpassで募集するようなオープンな勉強会から、外部に公開しないクローズドな勉強会まで、今まで多くの会社さんと勉強会を開催してきました。そこのあなたの会社ともぜひ一緒に勉強会しませんか？？Flutterでも、それ以外の勉強会でもOKです。ちょっと企画の相談をしてみませんか？''',
      talker: 'あかつき',
      talkerImageAssetPath: 'assets/akatsuki.png',
      talkTimeMinutes: 10,
    ),
    const TalkData(
      id: '0d2775b0-fbe2-42c2-aa92-3bad2ef9d77d',
      title: 'Flutterチームのことも気になるけど、Android/iOSチームのことも気になる人集合',
      overview: '''
実はFlutterエンジニアではない方、FlutterエンジニアだけどAndroid/iOSも気になる方どうぞいらっしゃい。
所属はFlutter/Android、案件はAndroid/iOSな私がチームの雰囲気や特徴などを知っている範囲でお伝えします。''',
      talker: 'あかつき',
      talkerImageAssetPath: 'assets/akatsuki.png',
      talkTimeMinutes: 5,
    ),
  ];
  talks.shuffle(Random());
  final talkGroups = talks.slices(4);
  final talksData = talkGroups.mapIndexed(
    (index, group) => TalksData(
      id: '44cc9f37-de10-4476-b458-cddb8939644b-${index + 1}',
      title: 'トーク一覧 ${index + 1}',
      talks: group,
    ),
  );

  return [
    ...talksData,
    ...talks,
    const VideoData(
      id: '970a57d7-d863-41ea-8df6-d42f44b828d6',
      title: 'テンプレートプロジェクト CM',
      assetPath: 'assets/commercial.mp4',
    ),
  ];
});
