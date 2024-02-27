import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(children: [
        Center(
          child: Text(
            product['title'] as String,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Image.network(product['thumbnail'] as String),
        // const SizedBox(
        //   height: 10,
        // ),
        Expanded(
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(10, 135, 133, 133),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      '\$${product['price']}',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            minimumSize: const Size(double.infinity, 50)),
                        onPressed: () {},
                        child: const Text(
                          'add to cart',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ))
                  ],
                ),
              )),
        )
      ]),
    );
  }
}
