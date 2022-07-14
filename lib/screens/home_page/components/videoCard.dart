import 'package:flutter/material.dart';

import '../../../data/youtube_home_data.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);
  final int index;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.35,
      width: size.width,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 81, 80, 80),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(details[index]['image']!),
              ),
            ),
            width: size.width,
            height: size.height * 0.25,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 15,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: const Color.fromARGB(255, 45, 42, 42),
                  ),
                  child: Text(
                    details[index]['duration']!,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 86, 84, 84),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(details[index]['avatar']!),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          details[index]['name']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              details[index]['author']!,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 3,
                              width: 3,
                              color: Colors.grey,
                            ),
                            Text(
                              details[index]['views']!,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 3,
                              width: 3,
                              color: Colors.grey,
                            ),
                            Text(
                              details[index]['time']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10.0, bottom: 10),
                  child: Icon(
                    Icons.more_vert,
                    size: 19,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
