
import 'prebuilt_maven_issue_demo_plugin_platform_interface.dart';

class PrebuiltMavenIssueDemoPlugin {
  Future<String?> getPlatformVersion() {
    return PrebuiltMavenIssueDemoPluginPlatform.instance.getPlatformVersion();
  }
}
