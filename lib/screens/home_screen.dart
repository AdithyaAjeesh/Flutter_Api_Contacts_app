import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/controller/provider_functions.dart';
import 'package:flutter_contacts_app/screens/contacts_container.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context);
    provider.getAllContacts();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(20),
            child: const TextField(
              style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Search for Contacts',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.redAccent,
                  size: 30,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          Expanded(
            child: provider.isLoading == false
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: provider.contacts.length,
                    itemBuilder: (context, index) {
                      final person = provider.contacts[index];
                      final name = person.name;
                      final phone = person.phone;
                      final address = person.address;
                      return contactContainer(
                        name: name.toString(),
                        phone: phone.toString(),
                        address: address.toString(),
                      );
                    },
                  ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.getAllContacts();
        },
        backgroundColor: Colors.redAccent,
        child: const Text('+'),
      ),
    );
  }
}
