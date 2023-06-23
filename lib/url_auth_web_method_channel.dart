import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'url_auth_web_platform_interface.dart';

/// An implementation of [UrlAuthWebPlatform] that uses method channels.
class MethodChannelUrlAuthWeb extends UrlAuthWebPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugins.flutter.io/url_auth');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Map<String, dynamic>> getQueryParams() async {
    var data = await methodChannel
        .invokeMethod<Map<Object?, Object?>>('getQueryParams');
    if (data == null) {
      return {};
    }
    Map<String, dynamic> entries = {};
    for (var e in data.entries) {
      entries[e.key.toString()] = e.value.toString();
    }
    return entries;
  }

  @override
  Future<void> launch(String url,
      {String? features, String? name, String? cookies}) {
    return methodChannel.invokeMethod('launch', {
      'url': url,
      'features': features,
      'name': name,
      'cookies': cookies,
    });
  }

  @override
  Future<void> pushState(dynamic state, String name, String url,
      {Map<String, String>? searchParams}) {
    return methodChannel.invokeMethod("pushState", {
      'state': state,
      'name': name,
      'url': url,
      'searchParams': searchParams
    });
  }

  @override
  Future<void> replaceState(dynamic state, String name, String url,
      {Map<String, String>? searchParams}) {
    return methodChannel.invokeMethod("replaceState", {
      'state': state,
      'name': name,
      'url': url,
      'searchParams': searchParams
    });
  }

  @override
  Future<String?> location() {
    return methodChannel.invokeMethod<String?>("location");
  }
}
