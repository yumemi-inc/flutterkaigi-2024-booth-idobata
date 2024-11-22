import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/slide_show/framework/slide_frame_query.dart';
import 'package:idobata/slide_show/slide_data.dart';

class TalksSlideScreen extends HookConsumerWidget {
  const TalksSlideScreen({
    required List<TalkData> talks,
    super.key,
  }) : _talks = talks;

  final List<TalkData> _talks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scale = context.frameScale;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: _talks.length,
          itemBuilder: (context, index) {
            final talk = _talks[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      talk.title,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage(talk.talkerImageAssetPath),
                          radius: 16 * scale,
                        ),
                        SizedBox(width: 8 * scale),
                        Expanded(
                          child: Text(
                            talk.talker,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '${talk.talkTimeMinutes}分',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
