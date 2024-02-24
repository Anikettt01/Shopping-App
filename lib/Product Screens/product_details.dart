import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Cart%20Screens/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object>product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  void OnTap(){
    if(selectedSize != 0){
      Provider.of<CartProvider>(context,listen: false)
          .AddProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': selectedSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product added successfully!")));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select a size!")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Details",
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold
          ),),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.product['title'] as String,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),),
            const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
            const Spacer(flex: 2,),
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$${widget.product['price']}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: (widget.product['sizes']as List<int>).length,
                        itemBuilder:(context,index){
                          final size = (widget.product['sizes']as List<int>)[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                label: Text(size.toString()),
                                backgroundColor: selectedSize==size ? Colors.yellow.shade600 :null,
                              ),
                            ),
                          );
                        } ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(onPressed: OnTap,
                      icon: Icon(Icons.shopping_cart,
                      color: Colors.black,),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow.shade600,
                          minimumSize: Size(double.infinity,50),
                        ),
                        label: Text("Add To Cart",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19
                          ),
                        ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
