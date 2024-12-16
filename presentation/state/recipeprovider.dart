import 'package:my_profile_app/features/food_recipe/controller/async_recipe_controller.dart';
import 'package:my_profile_app/features/food_recipe/domain/recipemodel.dart';
import 'package:my_profile_app/features/utils/exporter.dart';

final recipeProvider =
    AsyncNotifierProvider.family<RecipeController, RecipeModel, int>(
        RecipeController.new);
