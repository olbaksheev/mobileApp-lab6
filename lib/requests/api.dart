import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/mars_photos.dart';

class ApiService {
  static Future<MarsPhotos> fetchMarsPhotos() async {
    final uri = Uri.parse(
      'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=50&api_key=eQnprvXukgfNomTanZiHT1DqLApcABzFjI350dyZ',
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return MarsPhotos.fromJson(json.decode(response.body));
    } else {
      throw Exception('Ошибка загрузки данных');
    }
  }
}
