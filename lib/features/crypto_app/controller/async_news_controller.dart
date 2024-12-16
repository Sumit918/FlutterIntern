import 'dart:async';
import 'package:http/http.dart';
import 'package:my_profile_app/features/crypto_app/domain/newsmodel.dart';
import 'package:my_profile_app/features/utils/exporter.dart';

class NewsListController extends AsyncNotifier<NewsModel> {
  final Client client = Client();

  @override
  FutureOr<NewsModel> build() async {
    return load("politics", "np"); // Load default category and country
  }

  Future<NewsModel> load(String category, String country) async {
    // Update state to loading while fetching data
    state = const AsyncLoading();

    // Fetching the news data from the provided API endpoint
    final response = await client.get(Uri.parse(
        "https://newsdata.io/api/1/latest?apikey=pub_57713b6a12a2be1e75a1616dc05716d015233&category=politics&country=np"));

    try {
      if (response.statusCode == 200) {
        print(response.body);
        return newsModelFromJson(response.body); // Deserialize the response

        // If the status code indicates success
      } else {
        throw Exception("${response.statusCode} ${response.reasonPhrase}");
      }
    } catch (e) {
      rethrow; // Rethrow the exception for error handling
    }
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(
        () => load("politics", "np")); // Refresh with default values
  }

  Future<void> setCountry(String country) async {
    // Refresh news data based on the selected country
    state = await AsyncValue.guard(
        () => load("politics", country)); // Assuming category remains the same
  }

  Future<void> setCategory(String category) async {
    // Refresh news data based on the selected category
    state = await AsyncValue.guard(
        () => load(category, "np")); // Assuming country remains the same
  }
}
