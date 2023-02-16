import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/models.dart' as model;
import 'package:news_app/views/screens/detail/detail_screen.dart';

class VideoTile extends StatelessWidget {
  final double height;
  final double width;
  final model.New new_;

  const VideoTile({
    super.key,
    required this.height,
    required this.width,
    required this.new_,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), //<-- SEE HERE
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailScreen.routeName,
              arguments: new_,
            );
          },
          child: Container(
            height: height * 0.40,
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  width: width,
                  height: height * 0.29,
                  child: Image.network(
                    "http://10.0.2.2:8000/images-mobile/dart.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        new_.title,
                        style: const TextStyle(fontSize: 19),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat.yMEd().format(
                              DateTime.parse(new_.created_on),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.captions_bubble_fill,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: width * 0.010,
                                  ),
                                  const Text("225")
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
