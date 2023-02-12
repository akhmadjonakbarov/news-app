import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/cubits/categories/categories_cubit.dart';
import 'package:news_app/models/category.dart';
import './widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 0;

  double width = 0;

  final ValueNotifier<int> categoryIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: height * 0.025,
        ),
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
            _NavigationBar(
              height: height,
              onItemSelected: _onNavigationItemSelected,
            ),
            SizedBox(
              height: height * 0.020,
            ),
            CardTile(
              height: height,
              width: width,
            ),
            SizedBox(
              height: height * 0.020,
            ),
            Row(
              // mainAxisSize: MainAxisSize.min,
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
                      children: [
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
                      children: [
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
            Text(
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
          ],
        ),
      ),
    );
  }

  void _onNavigationItemSelected(i) {
    categoryIndex.value = i;
  }
}

class _NavigationBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  const _NavigationBar({
    super.key,
    required this.height,
    required this.onItemSelected,
  });

  final double height;

  @override
  State<_NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<_NavigationBar> {
  var selectedIndex = 0;
  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  List categories = [
    "World",
    "Sport",
    "Fashion",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          return SizedBox(
            height: widget.height * 0.05,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                Category category = state.categories[index];
                return CategoryTile(
                  isSelected: (selectedIndex == index),
                  onTap: handleItemSelected,
                  index: index,
                  category: category.name,
                );
              },
            ),
          );
        } else if (state is CategoriesError) {
          return Container(
            child: Text(state.errorMessage),
          );
        } else {
          return Container(
            child: Text("NO data"),
          );
        }
      },
    );
  }
}

class CategoryTile extends StatelessWidget {
  final int index;
  final String category;
  final ValueChanged<int> onTap;
  bool isSelected;
  CategoryTile(
      {super.key,
      this.isSelected = false,
      required this.index,
      required this.onTap,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () {
        onTap(index);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          category.toUpperCase(),
          style: TextStyle(
            color: isSelected ? const Color(0xFFFF566B) : Colors.grey,
          ),
        ),
      ),
    );
  }
}
