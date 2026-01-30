import 'package:flutter/material.dart';
import 'api_service.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Future users;

  @override
  void initState() {
    users = ApiService.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kelola User")),
      body: FutureBuilder(
        future: users,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return ListView(
            children: snapshot.data.map<Widget>((u) {
              return ListTile(
                title: Text(u['nama']),
                subtitle: Text(u['role']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await ApiService.deleteUser(int.parse(u['id']));
                    setState(() {
                      users = ApiService.getUsers();
                    });
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
