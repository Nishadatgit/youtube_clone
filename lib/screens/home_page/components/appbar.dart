import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YoutubeAppbar extends StatelessWidget {
  const YoutubeAppbar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                fontFamily: 'arial', fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: size.width / 3.3,
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FontAwesomeIcons.chromecast,
                    size: 20,
                  ),
                  const Icon(
                    FontAwesomeIcons.bell,
                    size: 20,
                  ),
                  const Icon(Icons.search),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/img2.jpg'),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}