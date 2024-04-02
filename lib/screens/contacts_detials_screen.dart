import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/controller/provider_functions.dart';
import 'package:provider/provider.dart';

class ContactDetailScreen extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  final String contactId;
  const ContactDetailScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.address,
    required this.contactId,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(128, 13, 13, 1),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromRGBO(128, 13, 13, 1),
          ),
          height: 550,
          width: 350,
          child: Consumer<ContactProvider>(
            builder: (context, pro, child) {
              return Column(
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Name: $name',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Phone Number: $phone',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Address: $address',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      provider.deleteContacts(contactId);
                      Navigator.of(context).pop();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: const Text(
                      'Delete Contact',
                      style: TextStyle(
                        color: Color.fromRGBO(128, 13, 13, 1),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
