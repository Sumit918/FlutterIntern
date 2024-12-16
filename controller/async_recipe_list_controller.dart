import 'dart:async';
import 'package:http/http.dart';
import 'package:my_profile_app/features/food_recipe/controller/cusine_cotroller.dart';
import 'package:my_profile_app/features/food_recipe/controller/maxfat_controller.dart';
import 'package:my_profile_app/features/food_recipe/controller/maxvitamink_controller.dart';
import 'package:my_profile_app/features/food_recipe/domain/recipelistmodel.dart';
import 'package:my_profile_app/features/utils/exporter.dart';

class RecipeListController extends AutoDisposeAsyncNotifier<RecipeListModel> {
  final client = Client();

  @override
  FutureOr<RecipeListModel> build() {
    return load();
  }

  Future<RecipeListModel> load() async {
    final cuisine = ref.watch(cuisineControllerProvider);
    final maxFat = ref.watch(maxFatControllerProvider);
    final maxVitaminK = ref.watch(maxVitaminKControllerProvider);

    final response = await client.get(Uri.parse(
        "https://api.spoonacular.com/recipes/complexSearch?apiKey=3a0ec5635c4641c2928397a24443f51f&query=pasta&maxVitaminK=$maxVitaminK&maxFat=$maxFat&cuisine=$cuisine"));

    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        return RecipeListModel.fromRawJson(response.body);
      } else {
        throw "${response.statusCode} ${response.reasonPhrase}";
      }
    } catch (e) {
      rethrow;
    }
  }
}
