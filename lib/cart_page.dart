import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
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
                subtitle: Row(
                  children: [
                    const Text(
                      'Size:',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text('${cartItem['size']}   '),
                    const Text(
                      'Price: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('\$${cartItem['price']}'),
                  ],
                ),
                trailing: IconButton(
                    color: Colors.red,
                    onPressed: () {},
                    icon: const Icon(Icons.delete)),
              );
            }));
  }
}
