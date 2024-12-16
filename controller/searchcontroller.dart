// import 'dart:async';

// import 'package:my_profile_app/features/food_recipe/domain/restaurantmodel.dart';
// import 'package:my_profile_app/features/food_recipe/presentation/state/restaurantprovider.dart';
// import 'package:my_profile_app/features/utils/exporter.dart';

// class RestaurantSearchController
//     extends FamilyAsyncNotifier<RestaurantModel, String> {
//   @override
//   FutureOr<RestaurantModel> build(String arg) {
//     return load();
//   }

//   Future<RestaurantModel> load() async {
//     final client = await ref.getDebouncedHttpClient(const Duration(seconds: 5));
//     return ref
//         .read(restaurantListProvider.notifier)
//         .load(keyword: arg, client: client);
//   }
// }
