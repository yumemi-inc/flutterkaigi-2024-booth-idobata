import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/data/all_slides_provider.dart';
import 'package:idobata/slide_show/framework/slide_frame.dart';
import 'package:idobata/slide_show/screen/talk_slide_screen.dart';
import 'package:idobata/slide_show/screen/talks_slide_screen.dart';
import 'package:idobata/slide_show/screen/video_slide_screen.dart';
import 'package:idobata/slide_show/slide_data.dart';

class SlideShowApp extends ConsumerWidget {
  const SlideShowApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(_goRouteProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => SlideFrame(child: child!),
    );
  }
}

final _goRouteProvider = Provider<GoRouter>((ref) {
  final slides = ref.watch(allSlidesProvider);
  final routes = slides.map(
    (slide) => GoRoute(
      path: slide.path,
      pageBuilder: (context, state) {
        final child = switch (slide) {
          VideoData() => VideoSlideScreen(data: slide),
          TalkData() => TalkSlideScreen(data: slide),
          TalksData() => TalksSlideScreen(talks: slide.talks),
        };
        return _fadeTransitionPage<void>(
          context: context,
          state: state,
          child: child,
        );
      },
    ),
  );
  return GoRouter(
    initialLocation: slides.first.path,
    routes: routes.toList(),
  );
});

// フェードイン・アウトのトランジションページを作成
Page<dynamic> _fadeTransitionPage<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}
