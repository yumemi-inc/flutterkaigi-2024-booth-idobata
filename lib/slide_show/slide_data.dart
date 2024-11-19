sealed class SlideData {
  const SlideData({
    required this.id,
  });

  final String id;

  String get path => '/$id';
}

final class VideoData extends SlideData {
  const VideoData({
    required super.id,
    required this.title,
    required this.assetPath,
  });

  final String title;
  final String assetPath;
}

final class TalkData extends SlideData {
  const TalkData({
    required super.id,
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
