import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_clone/data/new_data.dart';

import 'components/my_video_card.dart';
import 'components/sliver_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const YoutubeSliverAppbar(),
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, index) {
              final video = videos[index];
              return MyVideoCard(video: video);
            }, childCount: videos.length),
          )
        ],
      ),
    );
  }
}
