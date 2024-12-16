import 'package:flutter_riverpod/flutter_riverpod.dart';

class MaxVitaminKController extends StateNotifier<String?> {
  final List<String> vitaminKOptions = ['25', '30', '50', '70', '100'];

  MaxVitaminKController() : super('25'); // Default Vitamin K option

  void selectMaxVitaminK(String? vitaminK) {
    state = vitaminK;
  }
}

// Provider for MaxVitaminKController
final maxVitaminKControllerProvider =
    StateNotifierProvider<MaxVitaminKController, String?>(
  (ref) => MaxVitaminKController(),
);
