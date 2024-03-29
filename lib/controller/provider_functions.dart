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
}
