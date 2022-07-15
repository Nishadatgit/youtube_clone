import 'package:flutter/material.dart';
import 'package:youtube_clone/data/new_data.dart';

class YoutubeSliverAppbar extends StatelessWidget {
  const YoutubeSliverAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset('assets/png/ytlogo2.png'),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.cast)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              foregroundImage: AssetImage(currentUser.profileImageUrl),
            ))
      ],
    );
  }
}