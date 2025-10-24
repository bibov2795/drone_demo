# drone_demo

无人机演示应用 - 一个基于Flutter的跨平台项目。

## 项目简介

这是一个无人机地图演示应用，支持在地图上显示多个无人机图标，并提供详细信息查看功能。

## 环境要求

- Flutter SDK 3.9.0 或更高版本
- Dart SDK
- Visual Studio Community 2022 (Windows平台)
- Android Studio (Android开发必需)
- Android SDK (通过Android Studio安装)
- Java Development Kit (JDK) 8 或更高版本

## 快速开始

### 1. 环境检查
首先确认Flutter环境是否正确配置：
```bash
flutter doctor
```

### 2. 安装依赖
```bash
flutter pub get
```

### 3. 运行应用

#### Windows平台
```bash
# 检查可用设备
flutter devices

# 运行Windows应用
flutter run -d windows
```

#### Web平台
```bash
# Chrome浏览器
flutter run -d chrome

# Edge浏览器
flutter run -d edge
```

#### Android平台
```bash
flutter run -d android
```

### 4. 构建发布版本

#### Windows可执行文件
```bash
flutter build windows
```
生成的exe文件位于：`build\windows\x64
unner\Release\drone_demo.exe`

#### Web版本
```bash
flutter build web
```

#### Android APK
```bash
# 构建调试版APK
flutter build apk

# 构建发布版APK
flutter build apk --release

# 构建App Bundle (推荐用于Google Play发布)
flutter build appbundle --release
```
生成的APK文件位于：`build\app\outputs\flutter-apk\app-release.apk`

**网络问题解决方案：**
如果遇到Gradle下载失败或SSL握手错误，可以尝试以下解决方案：

1. **配置Gradle镜像源**
   在 `android/gradle/wrapper/gradle-wrapper.properties` 中修改：
   ```properties
   distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-7.5-all.zip
   ```

2. **配置Maven镜像源**
   在 `android/build.gradle` 中添加：
   ```gradle
   allprojects {
       repositories {
           maven { url 'https://maven.aliyun.com/repository/google' }
           maven { url 'https://maven.aliyun.com/repository/central' }
           maven { url 'https://maven.aliyun.com/repository/jcenter' }
           google()
           mavenCentral()
       }
   }
   ```

3. **清理并重新构建**
   ```bash
   flutter clean
   flutter pub get
   flutter build apk --release
   ```

## 开发工具

运行应用后，可以使用以下快捷键：
- `r` - 热重载 (Hot Reload)
- `R` - 热重启 (Hot Restart)
- `h` - 显示所有可用命令
- `d` - 分离调试器但保持应用运行
- `c` - 清屏
- `q` - 退出应用

## 调试工具

应用运行时会提供以下调试工具：
- **Dart VM Service**: http://127.0.0.1:4757/
- **Flutter DevTools**: http://127.0.0.1:9100/

## 故障排除

### 常见网络问题

#### Gradle下载失败
如果遇到 `SSLHandshakeException` 或 `ZipException` 错误：

1. **使用国内镜像源**
   ```bash
   # 设置Flutter镜像
   set PUB_HOSTED_URL=https://pub.flutter-io.cn
   set FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
   ```

2. **配置代理（如果使用VPN）**
   ```bash
   flutter config --enable-web
   flutter config --android-sdk <your-android-sdk-path>
   ```

3. **手动下载Gradle**
   - 访问 https://gradle.org/releases/
   - 下载对应版本的Gradle
   - 解压到本地目录
   - 修改 `gradle-wrapper.properties` 指向本地路径

#### 依赖下载超时
```bash
# 增加超时时间
flutter build apk --release --verbose
```

## 学习资源

如果这是你的第一个Flutter项目，推荐以下资源：

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter官方文档](https://docs.flutter.dev/)

## 技术特性

### 地图功能
- 使用 `flutter_map` 插件实现地图显示
- 支持OSM (OpenStreetMap) 瓦片服务
- 使用德国镜像服务器避免网络访问问题
- 支持地图缩放、平移等交互操作

### 无人机功能
- 多无人机图标显示
- 点击图标查看详细信息
- 实时位置更新模拟

### 串口通信
- 集成 `flutter_libserialport` 支持串口通信
- 可用于与硬件设备通信

## 依赖包

主要依赖：
- `flutter_map: ^7.0.2` - 地图显示
- `latlong2: ^0.9.0` - 地理坐标处理
- `flutter_libserialport: ^0.4.0` - 串口通信
- `cupertino_icons: ^1.0.8` - iOS风格图标

## 更新日志

### 2025-09-25 - 初始版本
- ✅ 实现多个无人机图标在地图上的显示
- ✅ 集成 `flutter_map` 地图插件，使用OSM瓦片服务器
- ✅ 配置德国镜像服务器解决网络访问问题
  - 原始服务器：`https://tile.openstreetmap.org/{z}/{x}/{y}.png` (被墙)
  - 当前使用：`https://tile.openstreetmap.de/{z}/{x}/{y}.png`
- ✅ 实现点击飞机图标显示详细信息功能
- ✅ 添加串口通信支持

#### 地图服务器配置
```dart
TileLayer(
  urlTemplate: "https://tile.openstreetmap.de/{z}/{x}/{y}.png",
  userAgentPackageName: 'com.example.drone_demo',
),
```

### 2025-10-22 - Windows平台支持
- ✅ 完善Windows平台运行环境配置
- ✅ 添加详细的运行和构建说明
- ✅ 更新README.md文档，包含完整的开发指南

### 2025-10-22 - Android平台支持
- ✅ 添加Android APK构建说明
- ✅ 完善Android开发环境要求
- ✅ 支持调试版和发布版APK构建
- ✅ 支持App Bundle格式构建





### 2025-10-24 - push to github
Step 1: Clean build artifacts (do this before committing)

```bash
# from repo root
flutter clean
flutter pub get
# optionally delete other generated directories if they remain
Remove-Item -Recurse -Force .dart_tool,build,android/.gradle,ios/Pods -ErrorAction SilentlyContinue
```
Step 2: Commit and push
Initialize git & push to GitHub
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/bibov2795/drone_demo.git
git push -u origin main
```

issue:
- Solve the problem of ```git add .```
   1. Run this in PowerShell (recommended if this is your machine and you trust the repository):
   ```git config --global --add safe.directory 'D:/03_workspace/flutter_space/drone_demo'```
   2. Verify the setting:
   ```git config --global --get-all safe.directory```

