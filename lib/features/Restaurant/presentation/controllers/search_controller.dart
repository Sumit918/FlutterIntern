import 'dart:async';
import 'package:my_profile_app/features/Restaurant/domain/restaurant_model.dart';
import 'package:my_profile_app/features/utils/exporter.dart';
import '../../data/restaurant_repository.dart';

class RestaurantSearchController
    extends FamilyAsyncNotifier<RestaurantModel, String> {
  @override
  FutureOr<RestaurantModel> build(String arg) {
    return load();
  }

  Future<RestaurantModel> load() async {
    // final client = await ref.getDebouncedHttpClient(Duration(seconds: 5));
    return RestaurantRepository().fetchRestaurant(
      query: arg,
    );
  }
}
