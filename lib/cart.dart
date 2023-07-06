import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController searchController = TextEditingController();
  String search = '';
  @override
  Widget build(BuildContext context) {
    // const List<Map<String, dynamic>> entries = [
    //   {"title": "Shoes", "price": "\$ 100"},
    //   {"title": "Shirt", "price": "\$ 50"},
    //   {"title": "Shoes", "price": "\$ 100"},
    //   {"title": "Shirt", "price": "\$ 50"},
    //   {"title": "Shoes", "price": "\$ 100"},
    //   {"title": "Shirt", "price": "\$ 50"},
    //   {"title": "Shoes", "price": "\$ 100"},
    //   {"title": "Shirt", "price": "\$ 50"},
    //   {"title": "Shoes", "price": "\$ 100"},
    //   {"title": "Shirt", "price": "\$ 50"},
    //   {"title": "Shoes", "price": "\$ 100"},
    //   {"title": "Shirt", "price": "\$ 50"},
    //   {"title": "Shoes", "price": "\$ 100"},
    //   {"title": "Shirt", "price": "\$ 50"},
    //   {"title": "Shoes", "price": "\$ 100"},
    //   {"title": "Shirt", "price": "\$ 50"},
    // ];
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 50,
            ),
            child: TextField(
              minLines: 5,
              maxLines: 5,
              maxLength: 100,
              textInputAction: TextInputAction.done,
              onChanged: (value) {
                // setState(() {
                //   search = value;
                // });
              },
              controller: searchController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                suffixIcon: GestureDetector(
                    onTap: () {
                      print("Search");
                    },
                    child: const Icon(
                      Icons.search,
                      size: 35,
                    )),
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
          Text('No search resutls found for $search',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          // ListView.builder(
          //     scrollDirection: Axis.vertical,
          //     physics: const NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemCount: entries.length,
          //     itemBuilder: (context, index) => ListTile(
          //           title: Text(
          //             ' ${index + 1}. ${entries[index]['title']}',
          //             style: const TextStyle(
          //               color: Colors.black,
          //               fontWeight: FontWeight.bold,
          //               fontSize: 20,
          //             ),
          //           ),
          //           trailing: Text(
          //             entries[index]['price']!,
          //             style: const TextStyle(
          //                 color: Colors.green,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 20),
          //           ),
          //         )),
        ],
      ),
    );
  }
}
