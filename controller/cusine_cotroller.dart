import 'package:flutter_riverpod/flutter_riverpod.dart';

class CuisineController extends StateNotifier<String?> {
  // List of available cuisines
  final List<String> cuisines = [
    'African',
    'Asian',
    'American',
    'British',
    'Cajun',
    'Caribbean',
    'Chinese',
    'Eastern European',
    'European',
    'French',
    'German',
    'Greek',
    'Indian',
    'Irish',
    'Italian',
    'Japanese',
    'Jewish',
    'Korean',
    'Latin American',
    'Mediterranean',
    'Mexican',
    'Middle Eastern',
    'Nordic',
    'Southern',
    'Spanish',
    'Thai',
    'Vietnamese',
  ];

  CuisineController() : super('Italian'); // Default cuisine is 'African'

  // Method to select a cuisine
  void selectCuisine(String? cuisine) {
    state = cuisine; // Updates the state to the selected cuisine
  }
}

// Define a provider for the CuisineController
final cuisineControllerProvider =
    StateNotifierProvider<CuisineController, String?>(
  (ref) => CuisineController(),
);
