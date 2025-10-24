pluginManagement {
    // --- 关键：显式读取 flutterSdkPath ---
    val flutterSdkPath = System.getenv("FLUTTER_ROOT")
        ?: extra["flutterSdkPath"]?.toString()
        ?: throw GradleException("Missing FLUTTER_ROOT or flutterSdkPath!")

    // 引入 Flutter 的 Gradle 插件
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
