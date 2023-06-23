import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_auth_web/url_auth_web_method_channel.dart';

void main() {
  MethodChannelUrlAuthWeb platform = MethodChannelUrlAuthWeb();
  const MethodChannel channel = MethodChannel('plugins.flutter.io/url_auth');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getPlatformVersion') {
        return '42';
      } else if (methodCall.method == 'getQueryParams') {
        return <String, dynamic>{'value': '42'};
      } else if (methodCall.method == 'location') {
        return "https://example.com";
      } else {}
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('launch', () async {
    await platform.launch('https://example.com');
  });

  test('getQueryParams', () async {
    Map<Object?, Object?> data = await platform.getQueryParams();
    expect(data['value'], '42');
  });

  test("location", () async {
    expect(await platform.location(), "https://example.com");
  });

  test("replaceState", () async {
    await platform.replaceState("", "", "");
  });

  test("pushState", () async {
    await platform.pushState("", "", "");
  });
}
