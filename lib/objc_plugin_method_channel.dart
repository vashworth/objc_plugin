import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'objc_plugin_platform_interface.dart';

/// An implementation of [ObjcPluginPlatform] that uses method channels.
class MethodChannelObjcPlugin extends ObjcPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('objc_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
