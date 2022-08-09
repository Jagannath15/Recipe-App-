import 'dart:ffi';

class recipe{

  String? name;
  String? image;
  double? rate;
  String? totaltime;

  recipe({this.image,this.name,this.rate,this.totaltime});

  factory recipe.fromJson(dynamic json){
    return recipe(
      name: json['name'] as String,
      image: json['images'][0]['hostedLargeUrl'] as String,
      rate: json['rating'] as double,
      totaltime: json['totalTime']as String
    );
  }

  static List<recipe> recipesFromSnapshot(List snapshot){
    return snapshot.map((data){
      return recipe.fromJson(data);
    }
    ).toList();
  }

}