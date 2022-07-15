import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/data/datas.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_clone/screens/main%20screens/nav_screen.dart';

class MyVideoCard extends ConsumerWidget {
  const MyVideoCard(
      {Key? key, required this.video, this.haspadding = false, this.ontap})
      : super(key: key);
  final Video video;
  final bool haspadding;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedVideoProvider.notifier).state = video;
        ref
            .read(minicontrollerprovider.notifier)
            .state
            .animateToHeight(state: PanelState.MAX);
        if (ontap != null) ontap!();
      },
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: haspadding ? 12.0 : 0),
                child: Image.network(
                  video.thumbnailImg,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 8,
                  right: haspadding ? 20 : 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    color: Colors.black,
                    child: Text(
                      video.duration,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    print('Tapped profile');
                  },
                  child: CircleAvatar(
                    foregroundImage: AssetImage(video.author.profileImageUrl),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          video.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 15),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${video.author.username} * ${video.viewCount} views *  ${timeago.format(video.datestamp)}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                const Icon(Icons.more_vert)
              ],
            ),
          )
        ],
      ),
    );
  }
}
