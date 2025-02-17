import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: SShapedAppBarClipper(),
                  child: Container(
                    height: screenHeight * 0.35,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFCBF49),
                          Color(0xFFF77F00),
                          Color(0xFFDC7100),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.20,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/chkn.jpg'),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          color: Color(0xFFD62828),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'John Doe exists. John Doe builds.\n'
                          'John Doe innovates. What’s next? Only time will tell...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 90),
            const TabBar(
              labelColor: Colors.black,
              indicatorColor: Color(0xFFD62828),
              tabs: [
                Tab(text: 'Posts'),
                Tab(text: 'Comments'),
                Tab(text: 'Stats'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView(
                      children: [
                        postCard('assets/images/chkn.jpg', 'Tech Conference', '30 November 2024, 9:00 AM\n13th Street, Park Avenue\nJohn Doe'),
                        postCard('assets/images/chkn.jpg', 'Leadership Seminar', '28 Jan 2025, 2:00 PM\n13th Street, Park Avenue\nJohn Doe'),
                        postCard('assets/images/chkn.jpg', 'Entrepreneurship Summit', '15 March 2025, 10:00 AM\n13th Street, Park Avenue\nJohn Doe'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView(
                      children: [
                        commentCard('Flutter Flash', '“Looks like an amazing event!”\n30 November 2024, 11:00 PM'),
                        const Divider(color: Colors.black54, thickness: 0.5),
                        commentCard('Bob’s annual BBQ', '“Wish I could’ve been there:(”\n2 August 2024, 10:31 PM'),
                        const Divider(color: Colors.black54, thickness: 0.5),
                        commentCard('Networking Lounge', '“Will the event be starting on time?”\n25 June 2023, 12:00 AM'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        statsCard('25', 'Events'),
                        statsCard('12', 'Comments'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget postCard(String imagePath, String title, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget commentCard(String title, String comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.arrow_upward, size: 18, color: Colors.black87),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  comment,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget statsCard(String number, String title) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 120,
        height: 120,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF77F00),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SShapedAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.5, size.height - 40);
    path.quadraticBezierTo(size.width * 0.75, size.height - 80, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(SShapedAppBarClipper oldClipper) => false;
}