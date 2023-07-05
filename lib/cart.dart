import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> entries = [
      {"title": "Shoes", "price": "\$ 100"},
      {"title": "Shirt", "price": "\$ 50"},
      {"title": "Shoes", "price": "\$ 100"},
      {"title": "Shirt", "price": "\$ 50"},
      {"title": "Shoes", "price": "\$ 100"},
      {"title": "Shirt", "price": "\$ 50"},
      {"title": "Shoes", "price": "\$ 100"},
      {"title": "Shirt", "price": "\$ 50"},
      {"title": "Shoes", "price": "\$ 100"},
      {"title": "Shirt", "price": "\$ 50"},
      {"title": "Shoes", "price": "\$ 100"},
      {"title": "Shirt", "price": "\$ 50"},
      {"title": "Shoes", "price": "\$ 100"},
      {"title": "Shirt", "price": "\$ 50"},
      {"title": "Shoes", "price": "\$ 100"},
      {"title": "Shirt", "price": "\$ 50"},
    ];
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: GoogleFonts.permanentMarker().fontFamily),
                hintText: 'Search',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: entries.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(
                      ' ${index + 1}. ${entries[index]['title']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    trailing: Text(
                      entries[index]['price']!,
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
        ],
      ),
    );
  }
}
