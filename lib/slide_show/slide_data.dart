sealed class SlideData {
  const SlideData({
    required this.id,
    required this.title,
    required this.slideChangeSeconds,
  });

  final String id;
  final String title;
  final int slideChangeSeconds;

  String get path => '/$id';
}

final class TalksData extends SlideData {
  const TalksData({
    required super.id,
    required super.title,
    required this.talks,
  }) : super(slideChangeSeconds: 10);

  final List<TalkData> talks;
}

final class VideoData extends SlideData {
  const VideoData({
    required super.id,
    required super.title,
    required this.assetPath,
  }) : super(slideChangeSeconds: 38);

  final String assetPath;
}

final class TalkData extends SlideData {
  const TalkData({
    required super.id,
    required super.title,
    required this.overview,
    required this.talker,
    required this.talkerImageAssetPath,
    required this.talkTimeMinutes,
  }) : super(slideChangeSeconds: 6);

  final String overview;
  final String talker;
  final String talkerImageAssetPath;
  final int talkTimeMinutes;
}
