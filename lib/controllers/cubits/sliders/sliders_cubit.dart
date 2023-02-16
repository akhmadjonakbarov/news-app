import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../api/api.dart';
import '../../../models/models.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit() : super(SlidersInitial());
  Future<void> getSliders() async {
    final List<Slider> sliders = [];
    Uri url = Uri.parse(Api.getSlidersUrl);
    try {
      emit(SlidersLoading());
      http.Response response = await http.get(url);
      var resData = jsonDecode(response.body);
      for (Map<String, dynamic> slider in resData) {
        sliders.add(Slider.fromMap(slider));
      }
      emit(
        SlidersLoaded(
          sliders: sliders,
        ),
      );
    } catch (e) {
      emit(
        SlidersError(
          errorMsg: e.toString(),
        ),
      );
    }
  }
}
