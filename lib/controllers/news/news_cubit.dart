import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
}
