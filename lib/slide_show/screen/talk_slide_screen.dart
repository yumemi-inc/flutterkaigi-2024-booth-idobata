import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

class _TalkContent extends HookWidget {
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
    final first = useState(true);
    useEffect(
      () {
        final timer = Timer.periodic(
          const Duration(seconds: 5),
          (timer) {
            if (context.mounted) {
              first.value = false;
              timer.cancel();
            }
          },
        );
        return timer.cancel;
      },
      const [],
    );

    const textStyle = TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: Colors.black54,
          offset: Offset(2, 2),
          blurRadius: 4,
        ),
      ],
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        final frameHeight = constraints.maxHeight;
        final frameWidth = constraints.maxWidth;
        return Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              left: frameWidth * 1 / 24,
            ),
            child: SizedBox(
              height: frameHeight * 3 / 4,
              width: frameWidth * 3.2 / 5,
              child: Stack(
                children: [
                  AnimatedCrossFade(
                    duration: const Duration(seconds: 3),
                    firstChild: SizedBox(
                      height: frameHeight * 3 / 4,
                      child: Center(
                        child: Text(
                          _title,
                          style: textStyle.copyWith(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    secondChild: Text(
                      _overview,
                      style: textStyle,
                    ),
                    crossFadeState: first.value
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      _talker,
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
