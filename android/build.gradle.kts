buildscript {
    ext.kotlin_version = '1.7.10' // Flutter 3.35.6 兼容的 Kotlin
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
    dependencies {
        classpath "com.android.tools.build:gradle:8.9.1"
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
