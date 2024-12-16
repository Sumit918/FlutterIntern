import 'package:my_profile_app/features/Restaurant/domain/restaurant_model.dart';
import 'package:my_profile_app/features/Restaurant/presentation/controllers/rest_list_controller.dart';
import 'package:my_profile_app/features/utils/exporter.dart';

final restaurantListProvider =
    AsyncNotifierProvider<RestaurantController, RestaurantModel>(
        RestaurantController.new);

// final restaurantSearchProvider = AsyncNotifierProvider<
//     RestaurantSearchController,
//     RestaurantModel,
//     String>(RestaurantSearchController.new);
