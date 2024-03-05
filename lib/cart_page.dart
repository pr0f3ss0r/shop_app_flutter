import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context)
        .cart; // context.watch<CartProvider>().cart
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
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                  'Are you sure you want to remove this item?'),
                              content: SizedBox(
                                height: 50,
                                width: 40,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          cartItem['thumbnail'] as String),
                                    ),
                                    Text(" ${cartItem['title']}"),
                                    Text(' Size:${cartItem['size']}'),
                                    Text(' Price:\$${cartItem['price']}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<CartProvider>()
                                        .removeFromCart(cartItem);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'))
                              ],
                            );
                          });
                      // Provider.of<CartProvider>(context, listen: false)
                      //     .removeFromCart(cart[index]);
                    },
                    icon: const Icon(Icons.delete)),
              );
            }));
  }
}
