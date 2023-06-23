import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_auth_web/url_auth_web.dart';
import 'package:url_auth_web/url_auth_web_method_channel.dart';
import 'package:url_auth_web/url_auth_web_platform_interface.dart';

class MockUrlAuthWebPlatform
    with MockPlatformInterfaceMixin
    implements UrlAuthWebPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<Map<String, dynamic>> getQueryParams() async {
    return {'value': '42'};
  }

  @override
  Future<void> launch(String url,
      {String? features, String name = "_blank", String cookies = ""}) async {}

  @override
  Future<String?> location() async {
    return "https://example.com";
  }

  @override
  Future<void> pushState(state, String name, String url,
      {Map<String, String>? searchParams}) async {}

  @override
  Future<void> replaceState(state, String name, String url,
      {Map<String, String>? searchParams}) async {}
}

void main() {
  final UrlAuthWebPlatform initialPlatform = UrlAuthWebPlatform.instance;

  test('$MethodChannelUrlAuthWeb is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUrlAuthWeb>());
  });

  test('getPlatformVersion', () async {
    UrlAuthWeb urlAuthWebPlugin = UrlAuthWeb();
    MockUrlAuthWebPlatform fakePlatform = MockUrlAuthWebPlatform();
    UrlAuthWebPlatform.instance = fakePlatform;

    expect(await urlAuthWebPlugin.getPlatformVersion(), '42');
  });

  test('launch', () async {
    UrlAuthWeb urlAuthWebPlugin = UrlAuthWeb();
    MockUrlAuthWebPlatform fakePlatform = MockUrlAuthWebPlatform();
    UrlAuthWebPlatform.instance = fakePlatform;

    await urlAuthWebPlugin.launch('https://example.com');
  });

  test('replaceState', () async {
    UrlAuthWeb urlAuthWebPlugin = UrlAuthWeb();
    MockUrlAuthWebPlatform fakePlatform = MockUrlAuthWebPlatform();
    UrlAuthWebPlatform.instance = fakePlatform;

    await urlAuthWebPlugin.replaceState("", "", 'https://example.com');
  });

  test('pushState', () async {
    UrlAuthWeb urlAuthWebPlugin = UrlAuthWeb();
    MockUrlAuthWebPlatform fakePlatform = MockUrlAuthWebPlatform();
    UrlAuthWebPlatform.instance = fakePlatform;

    await urlAuthWebPlugin.pushState("", "", 'https://example.com');
  });

  test('getQueryParams', () async {
    UrlAuthWeb urlAuthWebPlugin = UrlAuthWeb();
    MockUrlAuthWebPlatform fakePlatform = MockUrlAuthWebPlatform();
    UrlAuthWebPlatform.instance = fakePlatform;

    expect(await urlAuthWebPlugin.getQueryParams(), {'value': '42'});
  });

  test('location', () async {
    UrlAuthWeb urlAuthWebPlugin = UrlAuthWeb();
    MockUrlAuthWebPlatform fakePlatform = MockUrlAuthWebPlatform();
    UrlAuthWebPlatform.instance = fakePlatform;

    expect(await urlAuthWebPlugin.location(), "https://example.com");
  });
}
