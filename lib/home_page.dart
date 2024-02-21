import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Shoes\nCollection',
            style: GoogleFonts.lunasima(
                textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            )),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          )
        ],
      )),
    ));
  }
}
