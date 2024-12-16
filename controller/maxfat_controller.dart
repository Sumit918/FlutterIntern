import 'package:flutter_riverpod/flutter_riverpod.dart';

class MaxFatController extends StateNotifier<String?> {
  final List<String> fatOptions = ['10', '30', '50', '70', '90'];

  MaxFatController() : super('10'); // Default fat option

  void selectMaxFat(String? fat) {
    state = fat;
  }
}

// Provider for MaxFatController
final maxFatControllerProvider =
    StateNotifierProvider<MaxFatController, String?>(
  (ref) => MaxFatController(),
);
