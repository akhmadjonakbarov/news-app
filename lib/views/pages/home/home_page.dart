import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/cubits/categories/categories_cubit.dart';
import '../../../models/models.dart';
import 'widgets/widgets.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height * 0.025,
      ),
      child: Column(
        children: [
          Header(
            title: "News",
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                CustomTopBar(
                  height: height,
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                CardList(
                  height: height,
                  width: width,
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: width * 0.5,
                      height: height * 0.20,
                    ),
                    SizedBox(
                      width: width * 0.010,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: const [
                            Text(
                              "",
                              // "This is a long text",
                              style: TextStyle(fontSize: 30),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: false,
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              "Video",
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const Divider(),
                const Text(
                  "Sensible Beauty Tips For Enhancing Yout Appearance",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height * 0.16,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            width: width * 0.40,
                            margin: const EdgeInsets.only(right: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red,
                            ),
                            child: const Text("Data"),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Fashion",
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
                                  Icons.comment,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: width * 0.010,
                                ),
                                const Text("225")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Container(
                  child: Text(
                    "Last Posts",
                  ),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return NewTile(height: height, width: width);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
