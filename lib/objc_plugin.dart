
import 'objc_plugin_platform_interface.dart';

class ObjcPlugin {
  Future<String?> getPlatformVersion() {
    return ObjcPluginPlatform.instance.getPlatformVersion();
  }
}
