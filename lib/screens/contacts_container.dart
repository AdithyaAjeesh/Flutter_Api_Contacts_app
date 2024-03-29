import 'package:flutter/material.dart';

Widget contactContainer({
  required String name,
  required String phone,
  required String address,
}) =>
    GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 27, 26, 26),
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
                  color: Colors.redAccent,
                  size: 40,
                ),
                const SizedBox(width: 10),
                Text(
                  name.toString(),
                  style: const TextStyle(
                    color: Colors.white,
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
