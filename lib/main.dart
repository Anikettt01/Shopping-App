import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Navigation%20Screens/home_page.dart';
import 'package:shopping_app/Product%20Screens/product_details.dart';

import 'Cart Screens/cart_provider.dart';
import 'Products/global_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(253, 216, 53, 1)),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )
          ),
          primaryColor: const Color.fromRGBO(254, 206, 1, 1),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1)
          ),
          textTheme:  TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Lato',
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ),
          useMaterial3: true,
        ),
        home:HomePage(),
      ),
    );
  }
}
