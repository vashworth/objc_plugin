import 'package:flutter_test/flutter_test.dart';
import 'package:objc_plugin/objc_plugin.dart';
import 'package:objc_plugin/objc_plugin_platform_interface.dart';
import 'package:objc_plugin/objc_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockObjcPluginPlatform
    with MockPlatformInterfaceMixin
    implements ObjcPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ObjcPluginPlatform initialPlatform = ObjcPluginPlatform.instance;

  test('$MethodChannelObjcPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelObjcPlugin>());
  });

  test('getPlatformVersion', () async {
    ObjcPlugin objcPlugin = ObjcPlugin();
    MockObjcPluginPlatform fakePlatform = MockObjcPluginPlatform();
    ObjcPluginPlatform.instance = fakePlatform;

    expect(await objcPlugin.getPlatformVersion(), '42');
  });
}
