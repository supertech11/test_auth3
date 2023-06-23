// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'url_auth_web_platform_interface.dart';

class UrlAuthWeb {
  Future<String?> getPlatformVersion() {
    return UrlAuthWebPlatform.instance.getPlatformVersion();
  }

  Future<void> launch(String url,
      {String? features, String name = "_blank", String cookies = ""}) async {
    return UrlAuthWebPlatform.instance
        .launch(url, features: features, name: name, cookies: cookies);
  }

  Future<Map<String, dynamic>> getQueryParams() async {
    return UrlAuthWebPlatform.instance.getQueryParams();
  }

  Future<void> pushState(dynamic state, String name, String url,
      {Map<String, String>? searchParams}) {
    return UrlAuthWebPlatform.instance
        .pushState(state, name, url, searchParams: searchParams);
  }

  Future<void> replaceState(dynamic state, String name, String url,
      {Map<String, String>? searchParams}) {
    return UrlAuthWebPlatform.instance
        .replaceState(state, name, url, searchParams: searchParams);
  }

  Future<String?> location() {
    return UrlAuthWebPlatform.instance.location();
  }
}
