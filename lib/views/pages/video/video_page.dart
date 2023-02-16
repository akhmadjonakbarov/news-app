import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/cubits/news/news_cubit.dart';
import '../home/widgets/widgets.dart';
import 'widgets/widgets.dart';
import '../widgets/widgets.dart';
import '../../../models/models.dart' as model;

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height * 0.025,
      ),
      child: Column(
        children: [
          const Header(title: "Video"),
          CustomTopBar(height: height),
          BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is NewsLoaded) {
                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      ListView.builder(
                        padding: const EdgeInsets.all(0),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.news.length,
                        itemBuilder: (context, index) {
                          model.New new_ = state.news[index];
                          return VideoTile(
                            new_: new_,
                            height: height,
                            width: width,
                          );
                        },
                      )
                    ],
                  ),
                );
              } else if (state is NewsError) {
                return Center(
                  child: Text(
                    state.errorMsg,
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
