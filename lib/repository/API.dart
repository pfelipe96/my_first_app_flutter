import 'dart:async' show Future;
import 'package:http/http.dart' as http;
import '../data/Beer.dart';
import 'dart:convert';

class API {
  static API instance;

  static API getInstance() => instance == null ? instance = API() : instance;

  Future<List<Beer>> getBeers() async {
    final String url = 'https://api.punkapi.com/v2/beers';
    final response = await http.get(url);
    if (response.statusCode != 200) throw Exception("Failed get API");
    JsonDecoder json = jsonDecode(response.body);
    return (json as List).map((beer) => Beer.fromJSON(beer)).toList();
  }
}
