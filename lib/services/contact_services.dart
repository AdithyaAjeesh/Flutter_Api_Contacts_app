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

  Future<void> postData(ContactModel contact) async {
    final response = await http.post(
      Uri.parse("https://contacts-management-server.onrender.com/api/contacts"),
      body: jsonEncode(contact.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to post data');
    }
  }

  Future<void> updateData(contact,id) async {
    final body = contact.toJson();
    final response = await http.put(
      Uri.parse(
          "https://contacts-management-server.onrender.com/api/contacts/$id"),
      headers: 
        {'Content-Type': 'application/json; charset=UTF-8',},
      body: jsonEncode(body),
     
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update data');
    }
  }
}
