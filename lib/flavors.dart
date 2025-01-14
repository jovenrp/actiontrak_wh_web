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
        return 'Mobile Warehouse Dev';
      case Flavor.prod:
        return 'Mobile Warehouse';
      default:
        return 'title';
    }
  }

}
