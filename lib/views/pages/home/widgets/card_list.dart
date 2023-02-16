import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/cubits/sliders/sliders_cubit.dart';
import '../../../../models/models.dart' as sl;

class CardList extends StatelessWidget {
  const CardList({
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
      child: BlocBuilder<SlidersCubit, SlidersState>(
        builder: (context, state) {
          if (state is SlidersLoaded) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.sliders.length,
              itemBuilder: (context, index) {
                sl.Slider slider = state.sliders[index];
                return _CardTile(
                  width: width,
                  height: height,
                  slider: slider,
                );
              },
            );
          } else if (state is SlidersError) {
            return Container(
              width: width * 0.85,
              margin: const EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Text(
                "Sizda ${state.errorMsg} shunday xatolik mavjud.\nIltimos keyinroq urunib ko'ring",
              ),
            );
          } else {
            return Container(
              width: width * 0.85,
              margin: const EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: const CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _CardTile extends StatelessWidget {
  final sl.Slider slider;
  final double width;
  final double height;
  const _CardTile({
    super.key,
    required this.width,
    required this.height,
    required this.slider,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width * 0.85,
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              slider.image,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
          ),
        ),
      ],
    );
  }
}
