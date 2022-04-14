import 'package:http/http.dart';

const String apiKey = 'ebceb27137d7292a30d226be4a1d0f64';
const String apiId = '2ea74452';
const String apiUrl = 'https://api.edamam.com/search';

class RecipeService {
  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }

  Future getData(String url) async {
    print('Calling uri: $url');
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
