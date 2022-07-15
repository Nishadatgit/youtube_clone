import 'package:flutter/material.dart';
import 'package:youtube_clone/data/datas.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoInfo extends StatelessWidget {
  const VideoInfo({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '${video.viewCount} views ● ${timeago.format(video.datestamp)}',
            style:
                Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
          ),
          const Divider(),
          _ActionRow(video: video),
          const Divider(),
          _AuthorInfo(user: video.author),
          const Divider(),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _actionButton(context, Icons.thumb_up_outlined, video.likes),
        _actionButton(context, Icons.thumb_down_outlined, video.dislikes),
        _actionButton(context, Icons.reply_outlined, 'Share'),
        _actionButton(context, Icons.download_outlined, 'Download'),
        _actionButton(context, Icons.library_add_outlined, 'Save'),
      ],
    );
  }

  Widget _actionButton(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(height: 6.0),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  const _AuthorInfo({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {},
            child: CircleAvatar(
                foregroundImage: AssetImage(user.profileImageUrl))),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  user.username,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15),
                ),
              ),
              Flexible(
                child: Text(
                  '${user.subscribers} subscribers',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 14),
                ),
              )
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'SUBSCRIBE',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.red),
          ),
        )
      ],
    );
  }
}
