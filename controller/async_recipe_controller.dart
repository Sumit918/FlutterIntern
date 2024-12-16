import 'dart:async';
import 'package:http/http.dart';
import 'package:my_profile_app/features/food_recipe/domain/recipemodel.dart';
import 'package:my_profile_app/features/utils/exporter.dart';

class RecipeController extends FamilyAsyncNotifier<RecipeModel, int> {
  final Client client = Client();

  @override
  FutureOr<RecipeModel> build(int arg) async {
    return loadRecipes(arg);
  }

  Future<RecipeModel> loadRecipes(int id) async {
    // state = const AsyncLoading();

    final response = await client.get(Uri.parse(
        "https://api.spoonacular.com/recipes/$id/information?apiKey=3a0ec5635c4641c2928397a24443f51f"));
// &query=pasta&maxVitaminK=25&maxFat=10&cuisine=Italian
    try {
      if (response.statusCode == 200) {
        return RecipeModel.fromRawJson(response.body);
      } else {
        throw Exception("${response.statusCode} ${response.reasonPhrase}");
      }
    } catch (e) {
      rethrow; // Rethrow the exception for error handling
    }
  }
}
