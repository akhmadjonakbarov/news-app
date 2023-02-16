import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/cubits/news/news_cubit.dart';

import '../../../controllers/cubits/categories/categories_cubit.dart';
import '../../../models/models.dart' as model;

class CustomTopBar extends StatefulWidget {
  const CustomTopBar({
    super.key,
    required this.height,
  });

  final double height;

  @override
  State<CustomTopBar> createState() => _CustomTopBarState();
}

class _CustomTopBarState extends State<CustomTopBar> {
  var selectedIndex = 0;

  final ValueNotifier<int> categoryIndex = ValueNotifier(0);
  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    _onNavigationItemSelected(index);
  }

  void _onNavigationItemSelected(i) {
    categoryIndex.value = i;
  }

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
                model.Category category = state.categories[index];
                return _CategoryTile(
                  isSelected: (selectedIndex == index),
                  onTap: handleItemSelected,
                  index: index,
                  category: category,
                );
              },
            ),
          );
        } else if (state is CategoriesError) {
          return Container(
            decoration: const BoxDecoration(),
            child: Text(state.errorMessage),
          );
        } else {
          return Container(
            decoration: const BoxDecoration(),
            child: Text("NO data"),
          );
        }
      },
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final int index;
  final model.Category category;
  final ValueChanged<int> onTap;
  bool isSelected;
  _CategoryTile(
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
        BlocProvider.of<NewsCubit>(context).getNews(categoryId: category.id);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          category.name.toUpperCase(),
          style: TextStyle(
            color: isSelected ? const Color(0xFFFF566B) : Colors.grey,
          ),
        ),
      ),
    );
  }
}
