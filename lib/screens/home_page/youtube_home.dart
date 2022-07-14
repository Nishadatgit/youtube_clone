import 'package:flutter/material.dart';
import 'package:youtube_clone/data/youtube_home_data.dart';

import 'components/appbar.dart';
import 'components/videoCard.dart';

class YoutubeHome extends StatefulWidget {
  YoutubeHome({Key? key}) : super(key: key);
  final List<String> generes = ['All', 'Gaming', 'Music', 'Comedy', 'Live'];
  @override
  State<YoutubeHome> createState() => _YoutubeHomeState();
}

class _YoutubeHomeState extends State<YoutubeHome> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            YoutubeAppbar(size: size),
            showGenreArea(size),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: details.length,
                itemBuilder: (ctx, index) {
                  return VideoCard(
                    size: size,
                    index: index,
                  );
                })
          ]))
        ],
      )),
    );
  }

  //fwfkfmwknkwngkwr

  Container showGenreArea(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: size.width,
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 83, 82, 82),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.explore_outlined,
                    size: 18,
                  ),
                  Text('Explore')
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 30,
              width: 1,
              color: const Color.fromARGB(255, 83, 82, 82),
            ),
            const SizedBox(width: 10),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.generes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(right: 10, top: 6, bottom: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey),
                          color: selectedIndex == index
                              ? Colors.white.withOpacity(0.9)
                              : const Color.fromARGB(255, 109, 108, 108),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        widget.generes[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.black
                                : Colors.white,
                            fontSize: 13),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
