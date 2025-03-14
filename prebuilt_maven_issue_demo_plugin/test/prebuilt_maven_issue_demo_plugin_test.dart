import 'package:flutter_test/flutter_test.dart';
import 'package:prebuilt_maven_issue_demo_plugin/prebuilt_maven_issue_demo_plugin.dart';
import 'package:prebuilt_maven_issue_demo_plugin/prebuilt_maven_issue_demo_plugin_platform_interface.dart';
import 'package:prebuilt_maven_issue_demo_plugin/prebuilt_maven_issue_demo_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPrebuiltMavenIssueDemoPluginPlatform
    with MockPlatformInterfaceMixin
    implements PrebuiltMavenIssueDemoPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PrebuiltMavenIssueDemoPluginPlatform initialPlatform = PrebuiltMavenIssueDemoPluginPlatform.instance;

  test('$MethodChannelPrebuiltMavenIssueDemoPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPrebuiltMavenIssueDemoPlugin>());
  });

  test('getPlatformVersion', () async {
    PrebuiltMavenIssueDemoPlugin prebuiltMavenIssueDemoPlugin = PrebuiltMavenIssueDemoPlugin();
    MockPrebuiltMavenIssueDemoPluginPlatform fakePlatform = MockPrebuiltMavenIssueDemoPluginPlatform();
    PrebuiltMavenIssueDemoPluginPlatform.instance = fakePlatform;

    expect(await prebuiltMavenIssueDemoPlugin.getPlatformVersion(), '42');
  });
}
