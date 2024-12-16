import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_profile_app/features/crypto_app/controller/async_list_controller.dart';
import 'package:my_profile_app/features/crypto_app/controller/list_controller.dart';
import 'package:my_profile_app/features/crypto_app/domain/moviemodel.dart';

final selectedProvider = StateProvider<int>((ref) => 0);

final listProvider =
    NotifierProvider<ListController, List<String>>(ListController.new);
final movieListProvider =
    AsyncNotifierProvider<MovieListController, List<MovieModel>>(
        MovieListController.new);
