import 'package:flutter/material.dart';

class ContactDetailScreen extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  const ContactDetailScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
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
          child: Column(
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
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  'Edit Contact',
                  style: TextStyle(
                    color: Color.fromRGBO(128, 13, 13, 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  'Delete Contact',
                  style: TextStyle(
                    color: Color.fromRGBO(128, 13, 13, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
