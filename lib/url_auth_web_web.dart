// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;
import 'dart:html';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'url_auth_web_platform_interface.dart';

/// A web implementation of the UrlAuthWebPlatform of the UrlAuthWeb plugin.
class UrlAuthWebWeb extends UrlAuthWebPlatform {
  /// Constructs a UrlAuthWebWeb
  UrlAuthWebWeb();

  static void registerWith(Registrar registrar) {
    UrlAuthWebPlatform.instance = UrlAuthWebWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  @override
  Future<Map<String, dynamic>> getQueryParams() async {
    final Uri uri = Uri.dataFromString(Uri.base.toString());
    return uri.queryParameters;
  }

  @override
  Future<void> launch(String url,
      {String? features, String name = "_blank", String cookies = ""}) async {
    window.open(url, name, features);
    document.cookie = cookies;
  }

  @override
  Future<String?> location() async {
    return Uri.base.toString();
  }

  @override
  Future<void> pushState(state, String name, String url,
      {Map<String, String>? searchParams}) async {
    var parsedUrl = Uri.parse(url);
    if (searchParams != null) {
      parsedUrl.replace(queryParameters: searchParams);
    }
    window.history.pushState(state, name, parsedUrl.toString());
  }

  @override
  Future<void> replaceState(state, String name, String url,
      {Map<String, String>? searchParams}) async {
    var parsedUrl = Uri.parse(url);
    if (searchParams != null) {
      parsedUrl.replace(queryParameters: searchParams);
    }
    window.history.replaceState(state, name, parsedUrl.toString());
  }
}
