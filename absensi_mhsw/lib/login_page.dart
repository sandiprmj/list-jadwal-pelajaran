import 'package:flutter/material.dart';
import 'api_service.dart';
import 'dashboard_admin.dart';
import 'dashboard_dosen.dart';
import 'dashboard_mahasiswa.dart';

class LoginPage extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: email),
          TextField(controller: password, obscureText: true),
          ElevatedButton(
            child: const Text("Login"),
            onPressed: () async {
              var res = await ApiService.login(email.text, password.text);

              if (res['status'] == 'success') {
                if (res['role'] == 'admin') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AdminPage()),
                  );
                } else if (res['role'] == 'dosen') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DosenPage()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MahasiswaPage(res['id'])),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
