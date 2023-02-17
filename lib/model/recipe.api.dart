import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutternote/model/recipe.dart';

class RecipeApi {
  //const req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");
  //req.query({
  //"limit": "24",
  //"start": "0"
  //});
  //req.headers({
  //"X-RapidAPI-Key": "eeea5cd2d2msh21a7837efffc7a8p1a5317jsnb54b689dc1a3",
  //"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
  //"useQueryString": true
  //});
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "10", "start": "0", "tag": "list.recipe.popular"});
    final respone = await http.get(uri, headers: {
      "x-rapidapi-key": "eeea5cd2d2msh21a7837efffc7a8p1a5317jsnb54b689dc1a3",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(respone.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);

  }
}