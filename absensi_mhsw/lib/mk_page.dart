import 'package:flutter/material.dart';
import 'api_service.dart';

class MkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mata Kuliah")),
      body: FutureBuilder<List<dynamic>>(
        future: ApiService.getMK(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Data kosong"));
          }

          final listMK = snapshot.data!;

          return ListView(
            children: listMK.map<Widget>((mk) {
              return ListTile(title: Text(mk['nama_mk']));
            }).toList(),
          );
        },
      ),
    );
  }
}
