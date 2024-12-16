import 'dart:async';

import 'package:my_profile_app/features/Restaurant/data/restaurant_repository.dart';
import 'package:my_profile_app/features/Restaurant/domain/restaurant_model.dart';
import 'package:my_profile_app/features/utils/exporter.dart';
import 'package:my_profile_app/features/utils/extensions.dart';

class RestaurantController extends AsyncNotifier<RestaurantModel> {
  @override
  FutureOr<RestaurantModel> build() {
    return loadData();
  }

  Future<RestaurantModel> loadData() async {
    return RestaurantRepository()
        .fetch(client: await ref.getDebouncedHttpClient());
  }

  Future<void> searchRestaurants(String keyword) async {
    state = const AsyncLoading();
    try {
      final result =
          await RestaurantRepository().fetchRestaurant(query: keyword);

      state = AsyncData(result);
    } catch (e) {
      rethrow;
    }
  }
}
