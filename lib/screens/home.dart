import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildCard(
      IconData icon,
      String title,
      String subtitle,
      Color color,
      ) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GX20D Gaming"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.blue,
                ],
              ),
            ),
            child: const Center(
              child: Text(
                "GX20D GAMING",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          buildCard(
            Icons.sports_esports,
            "Games",
            "Browse the latest games",
            Colors.green,
          ),

          buildCard(
            Icons.apps,
            "Apps",
            "Discover useful apps",
            Colors.orange,
          ),

          buildCard(
            Icons.video_library,
            "Videos",
            "Watch gaming videos",
            Colors.red,
          ),

          buildCard(
            Icons.download,
            "Downloads",
            "Quick access to downloads",
            Colors.blue,
          ),

          const SizedBox(height: 25),

          const Center(
            child: Text(
              "GX20D Gaming © 2026",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}