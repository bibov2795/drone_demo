@echo off
echo 正在配置Flutter网络环境...

REM 设置Flutter镜像
set PUB_HOSTED_URL=https://pub.flutter-io.cn
set FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

echo 环境变量已设置:
echo PUB_HOSTED_URL=%PUB_HOSTED_URL%
echo FLUTTER_STORAGE_BASE_URL=%FLUTTER_STORAGE_BASE_URL%

echo.
echo 清理项目...
flutter clean

echo.
echo 获取依赖...
flutter pub get

echo.
echo 尝试构建APK...
flutter build apk --release

pause