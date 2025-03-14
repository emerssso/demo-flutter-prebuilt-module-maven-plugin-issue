import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'prebuilt_maven_issue_demo_plugin_method_channel.dart';

abstract class PrebuiltMavenIssueDemoPluginPlatform extends PlatformInterface {
  /// Constructs a PrebuiltMavenIssueDemoPluginPlatform.
  PrebuiltMavenIssueDemoPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static PrebuiltMavenIssueDemoPluginPlatform _instance = MethodChannelPrebuiltMavenIssueDemoPlugin();

  /// The default instance of [PrebuiltMavenIssueDemoPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelPrebuiltMavenIssueDemoPlugin].
  static PrebuiltMavenIssueDemoPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PrebuiltMavenIssueDemoPluginPlatform] when
  /// they register themselves.
  static set instance(PrebuiltMavenIssueDemoPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
