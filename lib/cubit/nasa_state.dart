// nasa_state.dart
import '../models/mars_photos.dart';

abstract class NasaState {}

class NasaLoadingState extends NasaState {}

class NasaLoadedState extends NasaState {
  final MarsPhotos photos;
  NasaLoadedState(this.photos);
}

class NasaErrorState extends NasaState {
  final String message;
  NasaErrorState(this.message);
}
