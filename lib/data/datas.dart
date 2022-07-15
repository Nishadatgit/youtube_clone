class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User(
      {required this.username,
      required this.profileImageUrl,
      required this.subscribers});
}

const User currentUser =
    User(username: 'Nishad', profileImageUrl: 'assets/images/img2.jpg', subscribers: '10M');

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailImg;
  final String duration;
  final DateTime datestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailImg,
    required this.duration,
    required this.datestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: 'x606y4Qwrxo',
    author: currentUser,
    title: 'Video one',
    thumbnailImg: 'https://www.techsmith.com/blog/wp-content/uploads/2019/06/YouTube-Thumbnail-Sizes.png',
    duration: '1:20',
    datestamp: DateTime(2021, 2, 26),
    viewCount: '900',
    likes: '2k',
    dislikes: '100',
  ),
  Video(
    id: 'vrPk6LB9bjo',
    author: currentUser,
    title: 'Video two',
    thumbnailImg: 'https://www.techsmith.com/blog/wp-content/uploads/2021/02/video-thumbnails-hero-1.png',
    duration: '4:50',
    datestamp: DateTime(2021, 2, 26),
    viewCount: '1M',
    likes: '900',
    dislikes: '201',
  ),
  Video(
    id: 'ilX5hnH8XoI',
    author: currentUser,
    title: 'Video three',
    thumbnailImg: 'https://i.pinimg.com/originals/e8/87/86/e88786b86bde6d09c02581a660275ffa.jpg',
    duration: '5:00',
    datestamp: DateTime(2021, 2, 26),
    viewCount: '10k',
    likes: '100',
    dislikes: '68',
  )
];
