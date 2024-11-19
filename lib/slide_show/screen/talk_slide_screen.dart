import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/slide_show/slide_data.dart';

class TalkSlideScreen extends HookConsumerWidget {
  const TalkSlideScreen({
    required TalkData data,
    super.key,
  }) : _data = data;

  final TalkData _data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey.shade600,
              Colors.grey.shade900,
            ],
          ),
        ),
        child: Stack(
          children: [
            _BackgroundTalkerImage(
              talkerImageAssetPath: _data.talkerImageAssetPath,
            ),
            _TalkContent(
              title: _data.title,
              talker: _data.talker,
              overview: _data.overview,
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundTalkerImage extends StatelessWidget {
  const _BackgroundTalkerImage({
    required String talkerImageAssetPath,
  }) : _talkerImageAssetPath = talkerImageAssetPath;

  final String _talkerImageAssetPath;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                Colors.white.withOpacity(0),
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.8),
                Colors.white,
              ],
            ).createShader(bounds);
          },
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.saturation,
            ),
            child: Image.asset(
              _talkerImageAssetPath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class _TalkContent extends StatelessWidget {
  const _TalkContent({
    required String title,
    required String talker,
    required String overview,
  })  : _title = title,
        _talker = talker,
        _overview = overview;

  final String _title;
  final String _talker;
  final String _overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 48,
        right: MediaQuery.of(context).size.width / 2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              _title,
              style: const TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _talker,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                  color: Colors.black54,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 24,
              ),
              child: Text(
                _overview,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
