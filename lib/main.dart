import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFE6F1FF),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2463),
        title: const Text(
          '扁鹊飞救',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Center(
              child: Text('Logo', style: TextStyle(fontSize: 10, color: Colors.white)),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _index,
        children: [
          _buildEmergencyTab(),
          const Center(child: Text('生活助理模块')),
          const Center(child: Text('情感交流模块')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: const Color(0xFFFF7D00),
        unselectedItemColor: const Color(0xFF0A2463),
        onTap: (val) => setState(() => _index = val),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.emergency), label: '应急救援'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: '生活助理'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '情感交流'),
        ],
      ),
    );
  }

  Widget _buildEmergencyTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("非诊断辅助工具", style: TextStyle(color: Color(0xFF0A2463))),
        const SizedBox(height: 40),
        Center(
          child: Container(
            width: 220,
            height: 220,
            decoration: const BoxDecoration(
              color: Color(0xFFFF7D00),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '一键呼救',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// trigger latest build
