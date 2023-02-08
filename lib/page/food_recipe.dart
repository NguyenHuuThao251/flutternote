import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/components/recipe_card.dart';
import 'package:flutternote/model/recipe.api.dart';
import 'package:flutternote/model/recipe.dart';

class FoodRecipe extends StatefulWidget {
  const FoodRecipe({super.key});

  @override
  State<FoodRecipe> createState() => _FoodRecipeState();
  
}

class _FoodRecipeState extends State<FoodRecipe> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_pizza_sharp, color: Colors.black,),
            Text('Food Recipe', style: TextStyle(
                color: Colors.black
            ),)
          ],
        ),
      ),
      body: _isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(
                title: _recipes[index].name,
                rating: _recipes[index].totalTime,
                cookTime: _recipes[index].rating.toString(),
                thumbnailUrl: _recipes[index].images);
          })
    );
  }

}