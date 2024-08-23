class EnviromentVariables {
  static String get host => const String.fromEnvironment('HOST');

  static String get apiKeyWeb => const String.fromEnvironment('API_KEY_WEB');
  static String get appIdWeb => const String.fromEnvironment('APP_ID_WEB');
  static String get messagingSenderIdWeb => const String.fromEnvironment('MESSAGING_SENDER_ID_WEB');
  static String get projectIdWeb => const String.fromEnvironment('PROJECT_ID_WEB');
  static String get authDomainWeb => const String.fromEnvironment('AUTH_DOMAIN_WEB');
  static String get storageBucketWeb => const String.fromEnvironment('STORAGE_BUCKET_WEB');
  static String get measurementIdWeb => const String.fromEnvironment('MEASUREMENT_ID_WEB');


  static String get apiKeyAndroid => const String.fromEnvironment('API_KEY_ANDROID');
  static String get appIdAndroid => const String.fromEnvironment('APP_ID_ANDROID');
  static String get messagingSenderIdAndroid => const String.fromEnvironment('MESSAGING_SENDER_ID_ANDROID');
  static String get projectIdAndroid => const String.fromEnvironment('PROJECT_ID_ANDROID');
  static String get authDomainAndroid => const String.fromEnvironment('AUTH_DOMAIN_ANDROID');
  static String get storageBucketAndroid => const String.fromEnvironment('STORAGE_BUCKET_ANDROID');

  static String get apiKeyIos => const String.fromEnvironment('API_KEY_IOS');
  static String get appIdIos => const String.fromEnvironment('APP_ID_IOS');
  static String get messagingSenderIdIos => const String.fromEnvironment('MESSAGING_SENDER_ID_IOS');
  static String get projectIdIos => const String.fromEnvironment('PROJECT_ID_IOS');
  static String get authDomainIos => const String.fromEnvironment('AUTH_DOMAIN_IOS');
  static String get storageBucketIOS => const String.fromEnvironment('STORAGE_BUCKET_IOS');
  static String get iosClientId => const String.fromEnvironment('CLIENT_ID_IOS');
  static String get iosBundleId => const String.fromEnvironment('iosBundleId');
}