import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

import 'global_variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = (Provider.of<CartProvider>(context).cart);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Cart',
      style: TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.bold
      ),
      )
      )
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context,index){
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
                radius: 30,
              ),
              trailing: IconButton(onPressed: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Delete Product',
                    style: Theme.of(context).textTheme.titleMedium,),
                  content: Text("Are you sure you want to remove the product from the cart?"),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      },
                          child: Text("No",style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),)),
                      TextButton(onPressed: (){
                        Provider.of<CartProvider>(context,listen: false).RemoveProduct(cartItem);
                        Navigator.of(context).pop();
                      },
                          child: Text("Yes",style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),)),
                    ],
                  );
                });
              },icon: Icon(Icons.delete,
              color: Colors.red,),),
              title: Text(
                cartItem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text('size: ${cartItem['size']}'),
            );
          }),
    );
  }
}
