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

}
