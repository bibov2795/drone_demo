// android/build.gradle.kts

rootProject.buildDir = file("../build")

subprojects {
    buildDir = file("${rootProject.buildDir}/${name}")
    evaluationDependsOn(":app")

    // 🔹 确保子模块也继承仓库配置（部分 Flutter 插件会依赖）
    repositories {
        google()
        mavenCentral()
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}
