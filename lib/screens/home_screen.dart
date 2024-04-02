import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/controller/provider_functions.dart';
import 'package:flutter_contacts_app/screens/add_contacts_screen.dart';
import 'package:flutter_contacts_app/screens/contacts_detials_screen.dart';
import 'package:flutter_contacts_app/screens/update_contacts_screen.dart';
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
          Container(
            margin: const EdgeInsets.only(top: 80),
            padding: const EdgeInsets.all(20),
            child: const TextField(
              style: TextStyle(
                  color: Color.fromRGBO(128, 13, 13, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Search for Contacts',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(128, 13, 13, 1),
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromRGBO(128, 13, 13, 1),
                  size: 30,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          Consumer<ContactProvider>(builder: (context, pro, child) {
            return Expanded(
              child: pro.contacts.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: pro.contacts.length,
                      itemBuilder: (context, index) {
                        final person = pro.contacts[index];
                        final name = person.name;
                        final phone = person.phone;
                        final address = person.address;
                        final id = person.sId;
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ContactDetailScreen(
                                  name: name.toString(),
                                  phone: phone.toString(),
                                  address: address.toString(),
                                  contactId: id.toString(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(128, 13, 13, 1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        const Icon(
                                          Icons.person_2,
                                          color: Colors.black,
                                          size: 40,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          name.toString().toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateContactScreen(
                                                  contactId: person,
                                                ),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            pro.deleteContacts(
                                                pro.contacts[index].sId!);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const AddContacts()));
          provider.getAllContacts();
        },
        backgroundColor: const Color.fromRGBO(128, 13, 13, 1),
        child: const Text(
          '+',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
