import 'package:my_profile_app/features/pc_profile/domain/system_specs_model.dart';

class SystemSpecsController {
  static SystemSpecs getSystemSpecs() {
    return SystemSpecs(
      cpuModel: '2.5 GHz Intel Core i7',
      ramModel: '16GB 1600MHz DDR3',
      graphicsModel: 'NVIDIA GeForce GT 750M 2 GB',
    );
  }
}
