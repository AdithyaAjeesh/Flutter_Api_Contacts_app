import 'dart:convert';

import 'package:flutter_contacts_app/models/contact_model.dart';
import 'package:http/http.dart' as http;

class ContactServices {
  Future<List<ContactModel>> getAllData() async {
    final response = await http.get(Uri.parse(
        "https://contacts-management-server.onrender.com/api/contacts"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<ContactModel> contact =
          data.map((item) => ContactModel.fromJson(item)).toList();
      return contact;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
