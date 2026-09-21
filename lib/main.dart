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
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MorningAzkarPage(),
                  ),
                );
              },
            ),

            _category(
              context,
              'أذكار المساء',
              Icons.nightlight_round,
              Colors.indigo,
              () {},
            ),

            _category(
              context,
              'أذكار النوم',
              Icons.bedtime,
              Colors.deepPurple,
              () {},
            ),

            _category(
              context,
              'أذكار بعد الصلاة',
              Icons.mosque,
              Colors.green,
              () {},
            ),

            _category(
              context,
              'عداد التسبيح',
              Icons.touch_app,
              Colors.teal,
              () {},
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
    VoidCallback onTap,
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
        onTap: onTap,
      ),
    );
  }
}

// صفحة أذكار الصباح
class MorningAzkarPage extends StatefulWidget {
  const MorningAzkarPage({super.key});

  @override
  State<MorningAzkarPage> createState() => _MorningAzkarPageState();
}

class _MorningAzkarPageState extends State<MorningAzkarPage> {
  final List<Map<String, dynamic>> azkar = [
    {
      'text':
          'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ...',
      'count': 0,
      'target': 1,
    },
    {
      'text': 'قُلْ هُوَ اللَّهُ أَحَدٌ ۝ اللَّهُ الصَّمَدُ ۝ لَمْ يَلِدْ وَلَمْ يُولَدْ ۝ وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ',
      'count': 0,
      'target': 3,
    },
    {
      'text': 'قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ ۝ مِن شَرِّ مَا خَلَقَ ۝ وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ ۝ وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ ۝ وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ',
      'count': 0,
      'target': 3,
    },
    {
      'text': 'قُلْ أَعُوذُ بِرَبِّ النَّاسِ ۝ مَلِكِ النَّاسِ ۝ إِلَٰهِ النَّاسِ ۝ مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ ۝ الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ ۝ مِنَ الْجِنَّةِ وَالنَّاسِ',
      'count': 0,
      'target': 3,
    },
    {
      'text':
          'أصبحنا وأصبح الملك لله، والحمد لله، لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير.',
      'count': 0,
      'target': 1,
    },
    {
      'text':
          'رضيت بالله ربًا، وبالإسلام دينًا، وبمحمد صلى الله عليه وسلم نبيًا.',
      'count': 0,
      'target': 3,
    },
  ];

  void increment(int index) {
    setState(() {
      if (azkar[index]['count'] < azkar[index]['target']) {
        azkar[index]['count']++;
      }
    });
  }

  void resetAll() {
    setState(() {
      for (var item in azkar) {
        item['count'] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'أذكار الصباح',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              '📿 أذكار الصباح',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            const Text(
              'اضغط على زر التكرار بعد قراءة كل ذكر',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 20),

            ...List.generate(
              azkar.length,
              (index) => _zikrCard(index),
            ),

            const SizedBox(height: 10),

            OutlinedButton.icon(
              onPressed: resetAll,
              icon: const Icon(Icons.refresh),
              label: const Text('إعادة العداد'),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _zikrCard(int index) {
    final item = azkar[index];
    final int current = item['count'];
    final int target = item['target'];
    final bool completed = current >= target;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              item['text'],
              style: const TextStyle(
                fontSize: 20,
                height: 1.8,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            Text(
              '$current / $target',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: completed ? null : () => increment(index),
                child: Text(
                  completed ? 'تم ✓' : 'اضغط للتكرار',
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
