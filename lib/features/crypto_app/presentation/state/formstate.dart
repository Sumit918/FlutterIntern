import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_profile_app/features/crypto_app/controller/form_controller.dart';
import 'package:my_profile_app/features/crypto_app/controller/list_controller.dart';
import 'package:my_profile_app/features/crypto_app/domain/formmodel.dart';

final selectedProvider = StateProvider<int>((ref) => 0);

final listProvider =
    NotifierProvider<ListController, List<String>>(ListController.new);

final formProvider =
    NotifierProvider<FormController, List<FormModel>>(FormController.new);
