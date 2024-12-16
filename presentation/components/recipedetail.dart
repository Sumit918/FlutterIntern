import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart';
import 'package:my_profile_app/features/food_recipe/domain/recipemodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_profile_app/features/food_recipe/presentation/state/recipeprovider.dart';
import 'package:my_profile_app/features/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key, required this.singlerecipe});
  final RecipeModel singlerecipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeidProvider = recipeProvider(singlerecipe.id!);
    final recipeData = ref.watch(recipeidProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: recipeData.when(
          data: (RecipeModel recipe) {
            return scrollview(recipe, loading: false);
          },
          error: (error, _) => Center(child: Text('Error: $error')),
          loading: () =>
              AbsorbPointer(child: scrollview(singlerecipe, loading: true))),
    );
  }

  Padding scrollview(RecipeModel recipe, {required bool loading}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Image
            if (recipe.image != null)
              loading
                  ? shimmerBox(height: 450)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        recipe.image!,
                        height: 450,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
            const SizedBox(height: 16),
            // Recipe Title
            loading
                ? shimmerBox(height: 24, width: 200)
                : Text(
                    recipe.title ?? 'Recipe Title',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            const SizedBox(height: 8),
            // Recipe Rating and Time
            loading
                ? shimmerBox(height: 20, width: 150)
                : Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[700], size: 20),
                      const SizedBox(width: 4),
                      Text(
                        (recipe.spoonacularScore?.toStringAsFixed(1) ?? "0.0"),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.access_time, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${recipe.readyInMinutes ?? 0} mins',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
            const SizedBox(height: 16),
            // Recipe Summary
            loading
                ? shimmerBox(width: 200, height: 20)
                : const Text(
                    'Summary',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            loading
                ? shimmerBox(height: 100)
                : HtmlWidget(
                    // ?? 'No summary available.'
                    parse(recipe.summary).outerHtml,
                    // style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    // print(Text.outerHtml);
                  ),
            const SizedBox(height: 24),
            Text(DateTime.now().format()),
            // Text("hello".capitalize()),
            // Ingredients
            loading
                ? shimmerBox(height: 20, width: 200)
                : Text(
                    'Ingredients (${recipe.extendedIngredients?.length ?? 0})',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            const SizedBox(height: 8),
            if (recipe.extendedIngredients != null)
              ...recipe.extendedIngredients!.map((ingredient) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: loading
                        ? shimmerBox(width: 200, height: 20)
                        : Row(
                            children: [
                              const Icon(Icons.circle,
                                  size: 8, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(
                                ingredient.original ?? 'Ingredient',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                  )),
            const SizedBox(height: 24),
            // Watch Video Button
            loading
                ? shimmerBox(width: 200, height: 50)
                : Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Action to watch video
                        // Open recipe.sourceUrl in a WebView or browser if available
                      },
                      icon: const Icon(Icons.play_circle_outline,
                          color: Colors.white),
                      label: const Text(
                        'Watch Videos',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .green.shade800, // Set the background color here
                        minimumSize:
                            const Size(200, 50), // Set width and height
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
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
