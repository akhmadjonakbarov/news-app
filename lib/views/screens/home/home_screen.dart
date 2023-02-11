import 'package:flutter/material.dart';
import './widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: height * 0.025),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "News",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 24,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    isSelected: true,
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.020,
            ),
            CardTile(
              height: height,
              width: width,
            ),
            Row(
              children: [
                Container(),
                Text(
                  "data",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          "Category",
          style: TextStyle(
            color: isSelected ? const Color(0xFFFF566B) : Colors.grey,
          ),
        ),
      ),
    );
  }
}
