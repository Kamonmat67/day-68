import 'package:flutter/material.dart';
import 'rec.dart';
import 'tri.dart';
import 'cir.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  bool get isArea => _currentIndex == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isArea ? 'Area Calculator' : 'Volume Calculator'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// -------- Title Card ----------
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      isArea ? Icons.format_shapes_sharp : Icons.view_in_ar,
                      size: 80,
                      color: Colors.blue,
                    ), 
                    const SizedBox(height: 10),
                    Text(
                      isArea
                          ? "เลือกคำนวณพื้นที่"
                          : "เลือกคำนวณปริมาตร",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// -------- Shape Buttons ----------
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [

                  _buildShapeCard(
                    "Rectangle",
                    Icons.crop_square,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RectanglePage(),
                        ),
                      );
                    },
                  ),

                  _buildShapeCard(
                    "Triangle",
                    Icons.change_history,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TrianglePage(),
                        ),
                      );
                    },
                  ),

                  _buildShapeCard(
                    "Circle",
                    Icons.circle_outlined,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CirclePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// -------- Bottom Navigation ---------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.square_foot),
            label: 'Area',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_in_ar),
            label: 'Volume',
          ),
        ],
      ),
    );
  }

  Widget _buildShapeCard(
      String title,
      IconData icon,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.indigo),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
