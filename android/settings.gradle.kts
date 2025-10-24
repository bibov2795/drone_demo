pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }

    // 🔹 指定 Android Gradle 插件和 Kotlin 插件版本
    plugins {
        id("com.android.application") version "8.6.0"
        id("com.android.library") version "8.6.0"
        id("org.jetbrains.kotlin.android") version "1.9.24"
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "drone_demo"
include(":app")

