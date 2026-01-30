import 'package:flutter/material.dart';

class MahasiswaPage extends StatelessWidget {
  final int userId;
  MahasiswaPage(this.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Mahasiswa ID: $userId")));
  }
}
