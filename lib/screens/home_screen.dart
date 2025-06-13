import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/nasa_cubit.dart';
import '../cubit/nasa_state.dart';
import 'photo_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mars Rover: Curiosity')),
      body: BlocBuilder<NasaCubit, NasaState>(
        builder: (context, state) {
          if (state is NasaLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NasaErrorState) {
            return Center(child: Text('Ошибка: ${state.message}'));
          }

          if (state is NasaLoadedState) {
            final photos = state.photos.photos ?? [];

            if (photos.isEmpty) {
              return const Center(child: Text('Нет данных для отображения'));
            }

            return ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];

                final imgUrl = photo.imgSrc ?? '';
                final cameraName =
                    photo.camera?.fullName ?? 'Неизвестная камера';
                final earthDate = photo.earthDate ?? 'Неизвестная дата';

                return ListTile(
                  leading: Image.network(
                    imgUrl,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
                  ),
                  title: Text('Камера: $cameraName'),
                  subtitle: Text('Дата: $earthDate'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PhotoDetailScreen(photo: photo),
                      ),
                    );
                  },
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
