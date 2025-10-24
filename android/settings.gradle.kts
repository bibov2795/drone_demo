pluginManagement {
    // 读取 flutterSdkPath，从 gradle.properties 或环境变量注入
    val flutterSdkPath = extra["flutterSdkPath"]?.toString()
        ?: System.getenv("FLUTTER_ROOT")
        ?: throw GradleException("Missing flutterSdkPath or FLUTTER_ROOT")

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
        maven { url = uri("https://storage.googleapis.com/download.flutter.io") }
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://storage.googleapis.com/download.flutter.io") }
    }
}

rootProject.name = "drone_demo"
include(":app")
