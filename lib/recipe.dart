import 'package:flutter/material.dart';
import 'package:receipe/recipe_Api.dart';
import 'package:receipe/recipe_model.dart';
import 'package:receipe/recp_cardl.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<recipe>? recipes;
  bool _isLoading = true;
  @override
  
  void initState() {
    // TODO: implement initState
    getRecipes(); 
  }
  Future<void> getRecipes() async {
    recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

    
@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipe')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: recipes!.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: recipes![index].name.toString(),
                      cookTime: recipes![index].totaltime.toString(),
                      rating: recipes![index].rate.toString(),
                      thumbnailUrl: recipes![index].image.toString()
                  );
                },
              ));
  }
}