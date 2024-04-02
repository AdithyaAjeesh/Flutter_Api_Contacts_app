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

  // Future<void> deleteContacts(String contactId) async {
  //   contacts.removeWhere((contact) => contact.sId == contactId);
  //   notifyListeners();
  // }

  Future<void> deleteContacts(String contactId) async {
    print('Deleting contact with ID: $contactId');
    contacts.removeWhere((contact) => contact.sId == contactId);
    print('Contact deleted successfully');
    notifyListeners();
  }

  void submitContact() {
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
}
