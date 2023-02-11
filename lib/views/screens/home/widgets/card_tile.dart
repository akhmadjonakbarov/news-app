import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.18,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: width * 0.85,
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
    );
  }
}
