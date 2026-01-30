import 'package:flutter/material.dart';
import 'user_page.dart';
import 'mk_page.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text("Kelola User"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => UserPage()),
              );
            },
          ),
          ElevatedButton(
            child: const Text("Kelola Mata Kuliah"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MkPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
