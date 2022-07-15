import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/data/datas.dart';
import 'package:youtube_clone/screens/main%20screens/components/my_video_card.dart';
import 'package:youtube_clone/screens/main%20screens/components/video_info.dart';
import 'package:youtube_clone/screens/main%20screens/nav_screen.dart';

class VideoScreen extends ConsumerStatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<VideoScreen> {
  ScrollController? _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ref
            .read(minicontrollerprovider.notifier)
            .state
            .animateToHeight(state: PanelState.MAX);
      },
      child: Scaffold(
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            controller: _scrollController,
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Consumer(
                  builder: (context, ref, child) {
                    final selectedvideo =
                        ref.watch(selectedVideoProvider.state).state;
                    return SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                selectedvideo!.thumbnailImg,
                                width: double.infinity,
                                height: 220,
                                fit: BoxFit.cover,
                              ),
                              IconButton(
                                onPressed: () {
                                  ref
                                      .read(minicontrollerprovider.notifier)
                                      .state
                                      .animateToHeight(state: PanelState.MIN);
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                          const LinearProgressIndicator(
                            value: 0.4,
                            valueColor: AlwaysStoppedAnimation(Colors.red),
                          ),
                          VideoInfo(video: selectedvideo),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final video = suggestedVideos[index];
                  return MyVideoCard(
                    video: video,
                    haspadding: true,
                    ontap: () => _scrollController!.animateTo(0,
                        duration: const Duration(microseconds: 200),
                        curve: Curves.easeIn),
                  );
                }, childCount: suggestedVideos.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
