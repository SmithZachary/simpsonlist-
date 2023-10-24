import 'package:viewer/core/constant/string_constant.dart';

enum Flavor {
  simpsons,
  wire,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.simpsons:
        return StringConstant.simpsons;
      case Flavor.wire:
        return StringConstant.wire;
      default:
        return StringConstant.simpsons;
    }
  }

  static String get queryParameter {
    switch (appFlavor) {
      case Flavor.simpsons:
        return StringConstant.simpsonsQueryParameter;

      case Flavor.wire:
        return StringConstant.wireQueryParameter;
      default:
        return StringConstant.simpsonsQueryParameter;
    }
  }
}
