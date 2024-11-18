final allSlides = [
  const VideoData(
    title: 'テンプレートプロジェクト CM',
    assetPath: 'assets/commercial.mp4',
  ),
  const TalkData(
    title: 'テンプレートプロジェクトについて',
    overview: 'テンプレートプロジェクトについて何でもお話します！',
    talker: 'blendthink',
    talkerIconAssetPath: 'assets/blendthink.png',
    talkTimeMinutes: 10,
  ),
];

sealed class SlideData {
  const SlideData();
}

final class VideoData extends SlideData {
  const VideoData({
    required this.title,
    required this.assetPath,
  });

  final String title;
  final String assetPath;
}

final class TalkData extends SlideData {
  const TalkData({
    required this.title,
    required this.overview,
    required this.talker,
    required this.talkerIconAssetPath,
    required this.talkTimeMinutes,
  });

  final String title;
  final String overview;
  final String talker;
  final String talkerIconAssetPath;
  final int talkTimeMinutes;
}
