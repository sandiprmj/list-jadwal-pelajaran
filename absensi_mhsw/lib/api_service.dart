import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2/absensi_api";

  // =====================
  // LOGIN
  // =====================
  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final res = await http.post(
      Uri.parse("$baseUrl/login.php"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    return jsonDecode(res.body);
  }

  // =====================
  // ADMIN - USERS
  // =====================
  static Future<List<dynamic>> getUsers() async {
    final res = await http.get(Uri.parse("$baseUrl/admin/get_users.php"));
    return jsonDecode(res.body);
  }

  static Future addUser(
    String nama,
    String email,
    String password,
    String role,
  ) async {
    await http.post(
      Uri.parse("$baseUrl/admin/add_user.php"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nama": nama,
        "email": email,
        "password": password,
        "role": role,
      }),
    );
  }

  static Future deleteUser(int id) async {
    await http.post(
      Uri.parse("$baseUrl/admin/delete_user.php"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"id": id}),
    );
  }

  // =====================
  // ADMIN - MATA KULIAH
  // =====================
  static Future<List<dynamic>> getMK() async {
    final res = await http.get(Uri.parse("$baseUrl/admin/get_mk.php"));
    return jsonDecode(res.body);
  }

  static Future addMK(String nama, int dosenId) async {
    await http.post(
      Uri.parse("$baseUrl/admin/add_mk.php"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"nama_mk": nama, "dosen_id": dosenId}),
    );
  }
}
