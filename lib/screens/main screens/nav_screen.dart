import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/data/datas.dart';

import 'home_screen.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;
  static const double _playerMinHeiht = 60;
  final _screens = [
    const HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text('Explore'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Add'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Subscriptions'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Library'),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) {
          final selectedvideo = ref.watch(selectedVideoProvider.state).state;

          return Stack(
            children: _screens
                .asMap()
                .map((i, screen) => MapEntry(
                    i,
                    Offstage(
                      offstage: _selectedIndex != i,
                      child: screen,
                    )))
                .values
                .toList()
              ..add(
                Offstage(
                  offstage: selectedvideo == null,
                  child: Miniplayer(
                    minHeight: _playerMinHeiht,
                    maxHeight: MediaQuery.of(context).size.height,
                    builder: (height, percentage) {
                      if (selectedvideo == null) {
                        return const SizedBox.shrink();
                      }
                      return Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    selectedvideo.thumbnailImg,
                                    height: _playerMinHeiht - 4,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              selectedvideo.title,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              selectedvideo.author.username,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.play_arrow)),
                                  IconButton(
                                      onPressed: () {
                                        ref
                                            .read(
                                                selectedVideoProvider.notifier)
                                            .state = null;
                                      },
                                      icon: const Icon(Icons.close))
                                ],
                              ),
                              const LinearProgressIndicator(
                                value: 0.4,
                                valueColor: AlwaysStoppedAnimation(Colors.red),
                              )
                            ],
                          ));
                    },
                  ),
                ),
              ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                activeIcon: Icon(Icons.add_circle),
                label: 'Add'),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions_outlined),
                activeIcon: Icon(Icons.subscriptions),
                label: 'Subscriptions'),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library_outlined),
                activeIcon: Icon(Icons.video_library),
                label: 'Library')
          ]),
    );
  }
}
