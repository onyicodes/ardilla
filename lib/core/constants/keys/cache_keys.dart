class CacheKeys {
  static const lastUserID = 'lastUserID';
  static String isLoggedIn(String lastUserId) => 'isLoggedIn$lastUserId';
  static String password(String lastUserId) => 'password$lastUserId';
  static String username(String lastUserId) => 'username$lastUserId';
  static String loginEmailOrPhone(String lastUserId) =>
      'emailOrPhone$lastUserId';
  static String userData(String lastUserId) => 'user$lastUserId';
  static String hasOnboarded = 'onboarded';
  static String accountSetupCompleted(String lastUserId) =>
      'accountSetupCompleted$lastUserId';
}
