import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/controller/provider_functions.dart';
import 'package:flutter_contacts_app/models/contact_model.dart';
import 'package:provider/provider.dart';

class UpdateContactScreen extends StatefulWidget {
  final contactId;

  const UpdateContactScreen({super.key, required this.contactId});

  @override
  State<UpdateContactScreen> createState() => _UpdateContactScreenState();
}



class _UpdateContactScreenState extends State<UpdateContactScreen> {

  // @override
  // void initState() {
  //   super.initState();


  //   final provider = Provider.of<ContactProvider>(context, listen: false);
  //   // final contact =
  //   //     provider.contacts.firstWhere((contact) => contact.sId == contactId);

  //   final contact = widget.contactId;

  //   // Initialize text controllers with existing contact details
  //   provider.nameController.text = contact.name;
  //   provider.phoneController.text = contact.phone.toString();
  //   provider.addressController.text = contact.address;
  //   provider.emailController.text = contact.email;
  // }
  @override
void initState() {
  super.initState();

  final provider = Provider.of<ContactProvider>(context, listen: false);
  final ContactModel contact = widget.contactId as ContactModel; // Cast contactId to ContactModel

  // Initialize text controllers with existing contact details
  provider.nameController.text = contact.name ?? '';
  provider.phoneController.text = contact.phone?.toString() ?? '';
  provider.addressController.text = contact.address ?? '';
  provider.emailController.text = contact.email ?? '';
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Consumer<ContactProvider>(
          builder: (context, provider, child) {
            return 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: provider.nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: provider.phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              TextField(
                controller: provider.addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
              ),
              TextField(
                controller: provider.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  provider.updateContact(widget.contactId);
                  Navigator.of(context).pop();
                },
                child: const Text('Update'),
              ),
            ],
          );
          },
        ),
      ),
    );
  }
}
