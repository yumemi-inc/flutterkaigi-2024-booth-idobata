sealed class SlideData {
  const SlideData({
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  String get path => '/$id';
}

final class TalksData extends SlideData {
  const TalksData({
    required super.id,
    required super.title,
    required this.talks,
  });

  final List<TalkData> talks;
}

final class VideoData extends SlideData {
  const VideoData({
    required super.id,
    required super.title,
    required this.assetPath,
  });

  final String assetPath;
}

final class TalkData extends SlideData {
  const TalkData({
    required super.id,
    required super.title,
    required this.overview,
    required this.talker,
    required this.talkerIconAssetPath,
    required this.talkTimeMinutes,
  });

  final String overview;
  final String talker;
  final String talkerIconAssetPath;
  final int talkTimeMinutes;
}
