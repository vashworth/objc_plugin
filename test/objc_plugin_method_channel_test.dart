import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:objc_plugin/objc_plugin_method_channel.dart';

void main() {
  MethodChannelObjcPlugin platform = MethodChannelObjcPlugin();
  const MethodChannel channel = MethodChannel('objc_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
