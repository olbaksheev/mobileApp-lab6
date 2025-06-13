// nasa_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'nasa_state.dart';
import '../requests/api.dart';

class NasaCubit extends Cubit<NasaState> {
  NasaCubit() : super(NasaLoadingState());

  void loadData() async {
    emit(NasaLoadingState());
    try {
      final data = await ApiService.fetchMarsPhotos();
      emit(NasaLoadedState(data));
    } catch (e) {
      emit(NasaErrorState(e.toString()));
    }
  }
}
