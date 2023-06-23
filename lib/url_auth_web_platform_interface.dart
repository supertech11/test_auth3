import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'url_auth_web_method_channel.dart';

abstract class UrlAuthWebPlatform extends PlatformInterface {
  /// Constructs a UrlAuthWebPlatform.
  UrlAuthWebPlatform() : super(token: _token);

  static final Object _token = Object();

  static UrlAuthWebPlatform _instance = MethodChannelUrlAuthWeb();

  /// The default instance of [UrlAuthWebPlatform] to use.
  ///
  /// Defaults to [MethodChannelUrlAuthWeb].
  static UrlAuthWebPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UrlAuthWebPlatform] when
  /// they register themselves.
  static set instance(UrlAuthWebPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> launch(String url,
      {String? features, String name = "_blank", String cookies = ""});

  Future<Map<String, dynamic>> getQueryParams();

  Future<void> pushState(dynamic state, String name, String url,
      {Map<String, String>? searchParams});

  Future<void> replaceState(dynamic state, String name, String url,
      {Map<String, String>? searchParams});

  Future<String?> location();
}
