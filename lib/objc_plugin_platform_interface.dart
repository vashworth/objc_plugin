import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'objc_plugin_method_channel.dart';

abstract class ObjcPluginPlatform extends PlatformInterface {
  /// Constructs a ObjcPluginPlatform.
  ObjcPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ObjcPluginPlatform _instance = MethodChannelObjcPlugin();

  /// The default instance of [ObjcPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelObjcPlugin].
  static ObjcPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ObjcPluginPlatform] when
  /// they register themselves.
  static set instance(ObjcPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
