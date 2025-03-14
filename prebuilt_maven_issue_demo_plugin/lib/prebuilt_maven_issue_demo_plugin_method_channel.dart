import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'prebuilt_maven_issue_demo_plugin_platform_interface.dart';

/// An implementation of [PrebuiltMavenIssueDemoPluginPlatform] that uses method channels.
class MethodChannelPrebuiltMavenIssueDemoPlugin extends PrebuiltMavenIssueDemoPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('prebuilt_maven_issue_demo_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
