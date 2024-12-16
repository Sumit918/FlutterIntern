import 'package:my_profile_app/features/food_recipe/controller/async_recipe_list_controller.dart';
import 'package:my_profile_app/features/food_recipe/domain/recipelistmodel.dart';
import 'package:my_profile_app/features/utils/exporter.dart';

final recipeListProvider =
    AsyncNotifierProvider.autoDispose<RecipeListController, RecipeListModel>(
        RecipeListController.new);
