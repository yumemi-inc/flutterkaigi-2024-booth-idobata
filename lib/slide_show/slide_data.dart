sealed class SlideData {
  const SlideData();
}

final class VideoData extends SlideData {
  const VideoData({
    required this.url,
  });

  final String url;
}

final class TalkData extends SlideData {
  const TalkData({
    required this.title,
    required this.overview,
    required this.talker,
    required this.talkerImageUrl,
    required this.talkTimeMinutes,
  });

  final String title;
  final String overview;
  final String talker;
  final String talkerImageUrl;
  final int talkTimeMinutes;
}
