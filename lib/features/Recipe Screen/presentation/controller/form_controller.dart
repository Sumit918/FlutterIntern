import 'package:my_profile_app/features/Recipe%20Screen/domain/custom_recipe_model.dart';
import 'package:my_profile_app/features/utils/exporter.dart';

class FoodFormController extends AutoDisposeNotifier<CustomFood?> {
  @override
  CustomFood? build() {
    return CustomFood(meta: Meta());
  }

  addMeta({String? diet, String? intolerance}) {
    state = state?.copyWith(
        meta: state?.meta?.copyWith(
            diets: diet != null ? [...state!.meta!.diets, diet] : null,
            intolerances: intolerance != null
                ? [...state!.meta!.intolerances, intolerance]
                : null));
    // print(state?.meta?.diets);
  }

  removeMeta({String? diet, String? intolerance}) {
    state = state?.copyWith(
        meta: state?.meta?.copyWith(
            diets: [...state!.meta!.diets..remove(diet)],
            intolerances: [...state!.meta!.intolerances..remove(intolerance)]));
  }
}
