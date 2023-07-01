import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant.dart';

class ApiService {
  static const _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<Restaurant> topHeadlines() async {
    final response = await http.get(
      Uri.parse("${_baseUrl}"),
    );
  }
}
