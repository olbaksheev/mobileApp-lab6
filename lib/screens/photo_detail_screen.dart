import 'package:flutter/material.dart';
import '../models/photo.dart';

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    final imgUrl = photo.imgSrc ?? '';
    final cameraFullName = photo.camera?.fullName ?? 'Неизвестная камера';
    final cameraName = photo.camera?.name ?? 'Неизвестная камера';
    final roverName = photo.rover?.name ?? 'Неизвестный марсоход';
    final earthDate = photo.earthDate ?? 'Неизвестная дата';
    final sol = photo.sol?.toString() ?? 'Неизвестный сол';

    return Scaffold(
      appBar: AppBar(title: Text(cameraFullName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imgUrl.isNotEmpty
                ? Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 100),
                  )
                : const Icon(Icons.broken_image, size: 100),
            const SizedBox(height: 10),
            Text('Марсоход: $roverName', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 5),
            Text(
              'Дата на Земле: $earthDate',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text('Сол: $sol', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 5),
            Text('Камера: $cameraName', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
