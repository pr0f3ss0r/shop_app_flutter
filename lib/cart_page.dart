import 'package:flutter/material.dart';
import 'package:shop_app/products.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return ListTile(
                leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(cartItem['thumbnail'] as String)),
                title: Text(
                  cartItem['title'].toString(),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                subtitle: Text('Size: ${cartItem['size']}'),
                trailing: IconButton(
                    color: Colors.red,
                    onPressed: () {},
                    icon: const Icon(Icons.delete)),
              );
            }));
  }
}
