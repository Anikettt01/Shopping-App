import 'package:flutter/material.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/product_details.dart';

import 'global_variables.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String>filters = const['All','Adidas','Nike','Bata'];
  late String selectedFilter;
  int CurrentPage=0;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: const BorderSide(
            color: Color.fromRGBO(225, 225, 225, 1)
        ),
        borderRadius: BorderRadius.circular(30)
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Shoes\nCollection',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),),
              ),
              Expanded(
                child:TextField(
                  decoration: InputDecoration(
                    hintText:'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: selectedFilter == filter ? const Color.fromRGBO(254, 206, 1, 1) : const Color.fromRGBO(245, 247, 249, 1),
                      side: const BorderSide(color: Color.fromRGBO(245, 247, 249, 1)),
                      label:Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder:(context,index){
                  final product = products[index];
                  return GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context){
                              return ProductDetailsPage(product: product);
                            },)
                      );
                    } ,
                    child: ProductCard(title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,),
                  );
                }
            ),
          ),
        ],
      ),
    );;
  }
}
