import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_profile_app/features/food_recipe/controller/cusine_cotroller.dart';
import 'package:my_profile_app/features/food_recipe/controller/maxfat_controller.dart';
import 'package:my_profile_app/features/food_recipe/controller/maxvitamink_controller.dart';
import 'package:my_profile_app/features/food_recipe/domain/recipelistmodel.dart';
import 'package:my_profile_app/features/food_recipe/presentation/state/recipelistprovider.dart';
import 'package:my_profile_app/features/food_recipe/presentation/components/recipedetail.dart';
import 'package:shimmer/shimmer.dart';

class RecipeListScreen extends ConsumerWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeListAsyncValue = ref.watch(recipeListProvider);
    final cuisine = ref.watch(cuisineControllerProvider);
    final maxFat = ref.watch(maxFatControllerProvider);
    final maxVitaminK = ref.watch(maxVitaminKControllerProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipe List'),
        ),
        body: recipeListAsyncValue.when(
            data: (RecipeListModel recipe) {
              return scrollview(
                  cuisine, ref, maxFat, maxVitaminK, recipeListAsyncValue,
                  loading: false);
            },
            error: (error, _) => Center(child: Text('Error: $error')),
            loading: () => AbsorbPointer(
                child: scrollview(null, ref, null, null, recipeListAsyncValue,
                    loading: true))));
  }

  Column scrollview(String? cuisine, WidgetRef ref, String? maxFat,
      String? maxVitaminK, AsyncValue<RecipeListModel> recipeListAsyncValue,
      {required bool loading}) {
    return Column(
      children: [
        // Dropdown for Cuisine selection
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: loading
              ? shimmerBox(height: 50, width: double.infinity)
              : DropdownButton<String>(
                  value: cuisine,
                  hint: const Text('Select Cuisine'),
                  isExpanded: true,
                  items: ref
                      .read(cuisineControllerProvider.notifier)
                      .cuisines
                      .map((cuisine) {
                    return DropdownMenuItem(
                      value: cuisine,
                      child: Text(cuisine),
                    );
                  }).toList(),
                  onChanged: (selectedCuisine) {
                    ref
                        .read(cuisineControllerProvider.notifier)
                        .selectCuisine(selectedCuisine);
                  },
                ),
        ),

        // Dropdown for Max Fat selection
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: loading
              ? shimmerBox(height: 50, width: double.infinity)
              : DropdownButton<String>(
                  value: maxFat,
                  hint: const Text('Select Max Fat'),
                  isExpanded: true,
                  items: ref
                      .read(maxFatControllerProvider.notifier)
                      .fatOptions
                      .map((fat) {
                    return DropdownMenuItem(
                      value: fat,
                      child: Text('$fat g'),
                    );
                  }).toList(),
                  onChanged: (selectedFat) {
                    ref
                        .read(maxFatControllerProvider.notifier)
                        .selectMaxFat(selectedFat);
                  },
                ),
        ),

        // Dropdown for Max Vitamin K selection
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: loading
              ? shimmerBox(height: 50, width: double.infinity)
              : DropdownButton<String>(
                  value: maxVitaminK,
                  hint: const Text('Select Max Vitamin K'),
                  isExpanded: true,
                  items: ref
                      .read(maxVitaminKControllerProvider.notifier)
                      .vitaminKOptions
                      .map((vitaminK) {
                    return DropdownMenuItem(
                      value: vitaminK,
                      child: Text('$vitaminK µg'),
                    );
                  }).toList(),
                  onChanged: (selectedVitaminK) {
                    ref
                        .read(maxVitaminKControllerProvider.notifier)
                        .selectMaxVitaminK(selectedVitaminK);
                  },
                ),
        ),

        // Recipe list display
        Expanded(
          child: recipeListAsyncValue.when(
            data: (recipeList) {
              // Ensure the recipes list is not null or empty before building the list
              if (recipeList.recipes == null || recipeList.recipes!.isEmpty) {
                return const Center(child: Text('No recipes found.'));
              }

              return ListView.builder(
                itemCount: recipeList.recipes!.length,
                itemBuilder: (context, index) {
                  final recipe = recipeList.recipes![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeScreen(singlerecipe: recipe),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: recipe.image != null
                            ? Image.network(
                                recipe.image!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )
                            : const Icon(Icons.fastfood, size: 50),
                        title: Text(recipe.title ?? 'No title'),
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading:
                      shimmerBox(height: 50, width: 50, shape: BoxShape.circle),
                  title: shimmerBox(height: 20, width: double.infinity),
                ),
              ),
            ),
            error: (error, stackTrace) =>
                Center(child: Text('Error: $error $stackTrace')),
          ),
        ),
      ],
    );
  }

  Shimmer shimmerBox(
      {double? height, double? width, BoxShape shape = BoxShape.rectangle}) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 97, 97, 97),
      highlightColor: Colors.grey,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
          color: Colors.grey,
        ),
      ),
    );
  }
}
