import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class YoutubeHome extends StatelessWidget {
  const YoutubeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width,
                    height: size.height * 0.06,
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage('assets/png/ytlogo.png'),
                            ),
                          ),
                        ),
                        const Text(
                          'Youtube',
                          style: TextStyle(
                              fontFamily: 'arial',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: size.width / 3,
                        ),
                        Expanded(
                          child: Container(
                            height: 40,
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(
                                  FontAwesomeIcons.chromecast,
                                  size: 20,
                                ),
                                Icon(
                                  FontAwesomeIcons.bell,
                                  size: 20,
                                ),
                                Icon(Icons.search),
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/img2.jpg'),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
