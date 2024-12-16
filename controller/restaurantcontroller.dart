// import 'dart:async';
// import 'package:http/http.dart';
// import 'package:my_profile_app/features/food_recipe/domain/restaurantmodel.dart';
// import 'package:my_profile_app/features/utils/exporter.dart';

// class RestaurantController extends AutoDisposeAsyncNotifier<RestaurantModel> {
//   final client = Client();

//   @override
//   FutureOr<RestaurantModel> build() {
//     return load();
//   }

//   Future<RestaurantModel> load() async {
//     final response = await client.get(Uri.parse(
//         "https://api.spoonacular.com/food/restaurants/search?apiKey=394725e0efc640c6ba76d5bc3ef5c36a&query=beachcafe&cuisine=italian&lat=37.78129959&lng=-122.38869477"));

//     try {
//       if (response.statusCode == 200) {
//         print(response.statusCode);
//         return RestaurantModel.fromRawJson(response.body);
//       } else {
//         throw "${response.statusCode} ${response.reasonPhrase}";
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   void searchRestaurants(String trim) {}
// }
