import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  //final String selectedSize;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(children: [
        Center(
          child: Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Image.network(widget.product['thumbnail'] as String),
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
                      '\$${widget.product['price']}',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        itemCount: (widget.product['size'] as List<int>).length,
                        itemBuilder: (context, index) {
                          final size =
                              (widget.product['size'] as List<int>)[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                  backgroundColor: selectedSize == size
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                  label: Text(
                                    size.toString(),
                                    style: TextStyle(
                                      color: selectedSize == size
                                          ? Colors.white
                                          : null,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            minimumSize: const Size(double.infinity, 50)),
                        onPressed: () {
                          //print(selectedSize);
                          if (selectedSize == 0) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Please choose a size'),
                              duration: Duration(seconds: 2),
                            ));
                          } else {
                            Provider.of<CartProvider>(context, listen: false)
                                .addToCart({
                              "title": widget.product['title'],
                              "price": widget.product['price'],
                              "size": selectedSize,
                              "thumbnail": widget.product['thumbnail'],
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Successfully added to cart'),
                              duration: Duration(seconds: 2),
                            ));
                          }
                        },
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

//  promptMessage(String message){
//   ScaffoldMessenger.maybeOf() showSnackBar(const SnackBar(
//                                   content: Text(message),
//                                   duration: Duration(seconds: 2),
//                                 ));
// }
// GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// Widget build(BuildContext context) {
//    return Scaffold(key: _scaffoldKey);
// }