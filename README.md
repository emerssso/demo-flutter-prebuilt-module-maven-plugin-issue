# Demo maven issue with Flutter prebuilt-modules

To reproduce the issue shown here, navigate to `./prebuilt_module/flutter_module`
and run `flutter build aar`.

## Problem

This issue occurs in Flutter 3.29.2 when using a Flutter plugin from a Flutter
[prebuilt-module](https://github.com/flutter/samples/add_to_app/prebuilt_module/README.md).

The prebuilt module will fail to build with `flutter build aar` with the following error:

```
* What went wrong:
Execution failed for task ':flutter:minifyReleaseWithR8'.
> Could not resolve all files for configuration ':flutter:releaseRuntimeClasspath'.
   > Could not find com.github.esafirm:android-image-picker:2.4.5.
     Searched in the following locations:
       - https://dl.google.com/dl/android/maven2/com/github/esafirm/android-image-picker/2.4.5/android-image-picker-2.4.5.pom
       - https://repo.maven.apache.org/maven2/com/github/esafirm/android-image-picker/2.4.5/android-image-picker-2.4.5.pom
       - https://storage.googleapis.com/download.flutter.io/com/github/esafirm/android-image-picker/2.4.5/android-image-picker-2.4.5.pom
     Required by:
         project :flutter > project :prebuilt_maven_issue_demo_plugin
```

The module will build successfully if you use `flutter build -P shrink=false` to bypass
minification.

## Repo

The repo demonstrates the issue.

### prebuilt_maven_issue_demo_plugin

This is a minimal plugin created with `flutter create --template=plugin --platforms=android .`.

It addes the Jitpack maven repo in its `android/build.gradle` on line 21, and
a dependency from that repo on line 55.

### working_app_demo

This is a minimal flutter app created with `flutter create --platforms=android .`.
It includes the plugin above in its pubspec.yaml, and adds the maven repo in its 
`android/build.gradle.kts` on line 5. It builds successfully.

### prebuilt_module

This is copy of the example prebuilt module setup from https://github.com/flutter/samples/add_to_app/prebuilt_module.
The plugin above has been added to the `flutter_module/pubspec.yaml`.
It fails to build with `flutter build aar`, but succeeds with the `-P` argument described above.

The `android_using_prebuilt_module` directory can successfully produce an app depending 
on the prebuilt module and plugin with `./gradlew build`. This required adding the Jitpack
maven repo on line 21 of its root `build.gradle`.