import 'package:flutter/material.dart';

void main() {
  runApp(const AthkarApp());
}

class AthkarApp extends StatelessWidget {
  const AthkarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'أذكار',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorSchemeSeed: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'أذكاري',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.mosque,
                    size: 70,
                    color: Colors.green,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'بسم الله الرحمن الرحيم',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'حصن المسلم في متناول يديك',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _category(
              context,
              'أذكار الصباح',
              Icons.wb_sunny,
              Colors.orange,
            ),
            _category(
              context,
              'أذكار المساء',
              Icons.nightlight_round,
              Colors.indigo,
            ),
            _category(
              context,
              'أذكار النوم',
              Icons.bedtime,
              Colors.deepPurple,
            ),
            _category(
              context,
              'أذكار بعد الصلاة',
              Icons.mosque,
              Colors.green,
            ),
            _category(
              context,
              'عداد التسبيح',
              Icons.touch_app,
              Colors.teal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _category(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_back_ios_new),
        onTap: () {},
      ),
    );
  }
}
