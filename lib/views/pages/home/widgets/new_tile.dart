import 'package:flutter/material.dart';

class NewTile extends StatelessWidget {
  const NewTile({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: height * 0.40,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height * 0.29,
            color: Colors.yellow,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Маҳаллаларда юрган кўчма шифохоналар",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: height * 0.010,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateTime.now().toString(),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
