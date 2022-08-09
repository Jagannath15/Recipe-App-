import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:receipe/recipe_model.dart';

class RecipeApi {
  static Future<List<recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "100", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "29188c84eemsh1473527a04f15b1p10ad21578f",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return recipe.recipesFromSnapshot(_temp);
  }
}