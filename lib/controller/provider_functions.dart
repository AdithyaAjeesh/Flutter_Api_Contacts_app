// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/models/contact_model.dart';
import 'package:flutter_contacts_app/services/contact_services.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contacts = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final ContactServices contactServices = ContactServices();
  List<ContactModel> filteredContacts = [];

  Future<void> getAllContacts() async {
    try {
      contacts = await contactServices.getAllData();
      notifyListeners();
    } catch (e) {
      Exception('Failed to load data $e');
    }
  }

  Future<void> deleteContacts(String contactId) async {
    try {
      await contactServices.deleteData(contactId);
      contacts.removeWhere((contact) => contact.sId == contactId);
      notifyListeners();
    } catch (e) {
      print('Failed to delete contact: $e');
    }
  }

  Future<void> submitContact() async {
    ContactModel contactModel = ContactModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      address: addressController.text.trim(),
      phone: int.tryParse(phoneController.text.trim()),
    );
    contactServices.postData(contactModel).then((value) {
      contactServices.getAllData();
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      addressController.clear();
    }).catchError((onError) {
      print('Failed To Add Contact');
    });
  }

  Future<void> updateContact(ContactModel contact) async {
    final id = contact.sId;
    final name = nameController.text;
    final email = emailController.text;
    final phone = int.tryParse(phoneController.text.trim());
    final address = addressController.text;
    final modelRequest = ContactModel(
        address: address, email: email, name: name, phone: phone, sId: id);
    try {
      await contactServices.updateData(modelRequest, id);
    } catch (e) {
      print('faled to update');
    }
    notifyListeners();
  }

  void searchContacts(String query) {
    filteredContacts = contacts
        .where((contact) =>
            (contact.name?.toLowerCase() ?? '').contains(query.toLowerCase()) ||
            (contact.phone?.toString() ?? '').contains(query))
        .toList();
    notifyListeners();
  }
}
