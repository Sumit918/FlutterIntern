import 'dart:convert';

import 'package:my_profile_app/features/food_recipe/domain/recipemodel.dart';

class RecipeListModel {
  final List<RecipeModel>? recipes;
  final int? offset;
  final int? number;
  final int? totalrecipes;

  RecipeListModel({
    this.recipes,
    this.offset,
    this.number,
    this.totalrecipes,
  });

  RecipeListModel copyWith({
    List<RecipeModel>? recipes,
    int? offset,
    int? number,
    int? totalrecipes,
  }) =>
      RecipeListModel(
        recipes: recipes ?? this.recipes,
        offset: offset ?? this.offset,
        number: number ?? this.number,
        totalrecipes: totalrecipes ?? this.totalrecipes,
      );

  factory RecipeListModel.fromRawJson(String str) =>
      RecipeListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecipeListModel.fromJson(Map<String, dynamic> json) =>
      RecipeListModel(
        recipes: json["results"] == null
            ? []
            : List<RecipeModel>.from(
                json["results"]!.map((x) => RecipeModel.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalrecipes: json["totalrecipes"],
      );

  Map<String, dynamic> toJson() => {
        "recipes": recipes == null
            ? []
            : List<dynamic>.from(recipes!.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalrecipes": totalrecipes,
      };
}
