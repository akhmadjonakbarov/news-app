import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/cubits/news/news_cubit.dart';

import 'controllers/cubits/categories/categories_cubit.dart';
import 'controllers/cubits/comments/comments_cubit.dart';
import 'controllers/cubits/sliders/sliders_cubit.dart';
import 'views/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: CategoriesCubit(),
        ),
        BlocProvider.value(
          value: CommentsCubit(),
        ),
        BlocProvider.value(
          value: SlidersCubit(),
        ),
        BlocProvider.value(
          value: NewsCubit(),
        ),
      ],
      child: const Wrap(),
    );
  }
}

class Wrap extends StatefulWidget {
  const Wrap({super.key});

  @override
  State<Wrap> createState() => _WrapState();
}

class _WrapState extends State<Wrap> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<CategoriesCubit>(context).getCategories();
    BlocProvider.of<SlidersCubit>(context).getSliders();
    BlocProvider.of<NewsCubit>(context).getNews();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        CommentsScreen.routeName: (context) => const CommentsScreen(),
        DetailScreen.routeName: (context) => const DetailScreen(),
      },
    );
  }
}
