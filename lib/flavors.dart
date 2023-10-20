enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Part App';
      case Flavor.prod:
        return 'Part App';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://dev.partapp.in/api';
      case Flavor.prod:
        return 'https://partapp.in/api';
      default:
        return 'https://partapp.in/api';
    }
  }

  static bool get defaultOTP {
    switch (appFlavor) {
      case Flavor.dev:
        return true;
      case Flavor.prod:
        return false;
      default:
        return false;
    }
  }
}
