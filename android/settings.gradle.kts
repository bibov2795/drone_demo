pluginManagement {
    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            file("local.properties").inputStream().use { properties.load(it) }
            val flutterSdkPath = properties.getProperty("flutter.sdk")
            require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
            flutterSdkPath
        }

    // ⚠️ 保持注释状态，不重新编译 flutter_tools
    // includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
        // 使用 Flutter SDK 内部预编译插件
        maven {
            url = uri("file://${flutterSdkPath.replace("\\", "/")}/packages/flutter_tools/gradle/build/repo")
        }
        mavenLocal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.9.1" apply false
}

include(":app")
