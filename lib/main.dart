import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/cubits/categories/categories_cubit.dart';
import 'package:news_app/views/screens/detail/detail_screen.dart';
import './views/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: CategoriesCubit(),
        )
      ],
      child: Wrap(),
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
    BlocProvider.of<CategoriesCubit>(context)
        .getCategories()
        .then((value) => print("ddd"));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: DetailScreen(),
      routes: {
        CommentsScreen.routeName: (context) => CommentsScreen(),
        DetailScreen.routeName: (context) => DetailScreen(),
      },
    );
  }
}
