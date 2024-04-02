import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/controller/provider_functions.dart';
import 'package:flutter_contacts_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AddContacts extends StatelessWidget {
  const AddContacts({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(128, 13, 13, 1),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
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
              provider.submitContact();
              provider.getAllContacts();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(128, 13, 13, 1),
            ),
            child: const Text(
              'Add Contacts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          )
        ],
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
