import 'photo.dart';

class MarsPhotos {
  List<Photo>? photos;

  MarsPhotos({this.photos});

  MarsPhotos.fromJson(Map<String, dynamic> json) {
    if (json['photos'] != null) {
      photos = <Photo>[];
      json['photos'].forEach((v) {
        photos!.add(new Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
