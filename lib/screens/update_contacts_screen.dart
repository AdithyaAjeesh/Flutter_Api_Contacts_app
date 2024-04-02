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
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<ContactProvider>(context, listen: false);
    final ContactModel contact = widget.contactId as ContactModel;
    provider.nameController.text = contact.name ?? '';
    provider.phoneController.text = contact.phone?.toString() ?? '';
    provider.addressController.text = contact.address ?? '';
    provider.emailController.text = contact.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(128, 13, 13, 1),
          ),
        ),
      ),
      body: Center(
        child: Consumer<ContactProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                const SizedBox(height: 40),
                inputbox(
                  controller: provider.nameController,
                  icons: Icons.text_format,
                  hint: 'Enter Name',
                ),
                inputbox(
                  controller: provider.phoneController,
                  icons: Icons.phone,
                  hint: 'Enter PhoneNumber',
                ),
                inputbox(
                  controller: provider.addressController,
                  icons: Icons.place,
                  hint: 'Enter Address',
                ),
                inputbox(
                  controller: provider.emailController,
                  icons: Icons.email,
                  hint: 'Enter Email',
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    provider.updateContact(widget.contactId);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(128, 13, 13, 1),
                  ),
                  child: const Text(
                    'Update Contacts',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget inputbox({
  required TextEditingController controller,
  required IconData icons,
  required String hint,
}) =>
    Container(
      margin: const EdgeInsets.all(15),
      child: TextField(
        style: const TextStyle(
            color: Color.fromRGBO(128, 13, 13, 1), fontWeight: FontWeight.bold),
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(128, 13, 13, 1),
          ),
          prefixIcon: Icon(
            icons,
            color: const Color.fromRGBO(128, 13, 13, 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
