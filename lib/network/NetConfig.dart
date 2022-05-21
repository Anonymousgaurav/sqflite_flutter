enum Environments { DEV, PRE, PROD }

abstract class _Endpoints {
  static String USERS_LISTS() =>
      "http://www.mocky.io/v2/5d565297300000680030a986";
}

abstract class NetConfig {
  static Environments env = Environments.DEV;

  static String getUserLists() {
    switch (NetConfig.env) {
      case Environments.PRE:
        return _Endpoints.USERS_LISTS();
      case Environments.PROD:
        return _Endpoints.USERS_LISTS();
      case Environments.DEV:
      default:
        return _Endpoints.USERS_LISTS();
    }
  }
}
