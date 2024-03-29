import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/models/contact_model.dart';
import 'package:flutter_contacts_app/services/contact_services.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contacts = [];

  bool isLoading = false;
  String error = '';

  final ContactServices contactServices = ContactServices();

  Future<void> getAllContacts() async {
    try {
      isLoading = true;
      error = '';
      contacts = await contactServices.getAllData();
    } catch (e) {
      error = 'Failed to load data $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
