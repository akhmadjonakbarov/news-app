import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/screens/screens.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});
  static const String routeName = "/detail-screen";

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: height * 0.025,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.010,
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        child: const Icon(
                          CupertinoIcons.back,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.010,
              ),
              const Text(
                "Tips for Preventing And Controlling High Blood Pressure",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.010,
              ),
              Container(
                decoration: const BoxDecoration(),
                child: const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.010,
              ),
              Container(
                height: height * 0.02,
                color: Colors.grey.withOpacity(0.2),
              ),
              SizedBox(
                height: height * 0.010,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Related",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.020,
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.42,
                      height: height * 0.16,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.050,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      width: width * 0.40,
                      height: height * 0.16,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tips for Preventing And Controlling High Blood Pressure",
                            style: TextStyle(fontSize: height * 0.022),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("LOCAL"),
                              InkWell(
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.comment,
                                      size: 18,
                                    ),
                                    Text("225")
                                  ],
                                ),
                              )
                            ],
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
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.15, vertical: height * 0.015),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavigationItem(
              icon: CupertinoIcons.captions_bubble_fill,
              onTap: () {
                Navigator.of(context).pushNamed(CommentsScreen.routeName);
              },
              text: "999",
            ),
            _bottomNavigationItem(
              icon: Icons.share,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationItem({
    required IconData icon,
    String? text,
    required Function() onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        // padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(),
        alignment: text != null ? null : Alignment.center,
        width: width * 0.16,
        height: height * 0.05,
        child: Stack(
          children: [
            Icon(
              icon,
              size: 38,
              color: Colors.grey,
            ),
            if (text != null)
              Positioned(
                left: 18,
                child: Container(
                  height: 18,
                  width: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF85468),
                  ),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
