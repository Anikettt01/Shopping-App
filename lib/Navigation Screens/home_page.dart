import 'package:flutter/material.dart';
import 'package:shopping_app/Cart%20Screens/cart_page.dart';
import 'package:shopping_app/Products/global_variables.dart';
import 'package:shopping_app/Product%20Screens/product_card.dart';
import 'package:shopping_app/Product%20Screens/product_details.dart';
import 'package:shopping_app/Product%20Screens/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int CurrentPage=0;
  List<Widget>pages = [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        index: CurrentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: CurrentPage,
        onTap: (value){
          setState(() {
            CurrentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,
          ),
          label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp),
          label: ''),
        ],
      ),
    );
  }
}