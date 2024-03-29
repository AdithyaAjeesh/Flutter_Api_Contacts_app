import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/screens/contacts_detials_screen.dart';

Widget contactContainer({
  required BuildContext context,
  required String name,
  required String phone,
  required String address,
}) =>
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContactDetailScreen(
              name: name,
              phone: phone,
              address: address,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                const Icon(
                  Icons.person_2,
                  color: Colors.black,
                  size: 40,
                ),
                const SizedBox(width: 10),
                Text(
                  name.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
