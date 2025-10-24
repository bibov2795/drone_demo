import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class Drone {
  final String id;
  final LatLng position;
  final DateTime timestamp;

  Drone({required this.id, required this.position, required this.timestamp});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drone RID Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Drone RID Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _fakeSerialData = "等待串口数据...";
  List<Drone> _drones = [
    Drone(
      id: "Drone-1",
      position: LatLng(39.9042, 116.4074), // 北京
      timestamp: DateTime.now(),
    ),
  ];

  /// 模拟接收多个无人机数据
  void _simulateSerialData() {
    final random = Random();
    setState(() {
      _fakeSerialData = "模拟接收数据: ${DateTime.now()}";

      // 随机生成 1~5 架无人机
      _drones = List.generate(random.nextInt(5) + 1, (index) {
        double latOffset = (random.nextDouble() - 0.5) * 0.02; // ±0.01 度
        double lonOffset = (random.nextDouble() - 0.5) * 0.02;
        return Drone(
          id: "Drone-${index + 1}",
          position: LatLng(39.9042 + latOffset, 116.4074 + lonOffset),
          timestamp: DateTime.now(),
        );
      });
    });
  }

  void _showDroneInfo(Drone drone) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text("无人机信息 - ${drone.id}"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: ${drone.id}"),
              Text("纬度: ${drone.position.latitude.toStringAsFixed(6)}"),
              Text("经度: ${drone.position.longitude.toStringAsFixed(6)}"),
              Text("更新时间: ${drone.timestamp.toLocal()}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("关闭"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 上半部分：地图
          Expanded(
            flex: 3,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(39.9042, 116.4074), // 北京
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://tile.openstreetmap.de/{z}/{x}/{y}.png", // 北外镜像
                  userAgentPackageName: 'com.example.drone_demo',
                ),
                MarkerLayer(
                  markers: _drones.map((drone) {
                    return Marker(
                      point: drone.position,
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () => _showDroneInfo(drone),
                        child: const Icon(
                          Icons.airplanemode_active,
                          color: Colors.red,
                          size: 32,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // 下半部分：串口数据和按钮
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '串口数据显示：',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  _fakeSerialData,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _simulateSerialData,
                  child: const Text("模拟接收多架无人机数据"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
