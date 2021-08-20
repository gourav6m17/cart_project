import 'package:cart_project/const/products_data.dart';
import 'package:cart_project/model/product_model.dart';
import 'package:cart_project/scr/cart.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int itemCounter = 1;
  List<Product> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Products"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text("Products"),
              ),

              /// Here you will implement StreamBuilder
              ListView.builder(
                shrinkWrap: true,
                itemCount: productsList.length,
                itemBuilder: (context, int index) {
                  final product = productsList[index];
                  return ListTile(
                    onTap: () {
                      setState(() {
                        if (cartItems.contains(product)) {
                          cartItems.remove(product);
                        }
                        cartItems.add(product);
                      });
                    },
                    title: Text(product.title),
                    subtitle: Text(product.description),
                    trailing: Text(product.price.toString() + " \$"),
                  );
                },
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CustomerCart(products: cartItems))),
                  child: Text("Go to cart"))
            ],
          ),
        ),
        bottomNavigationBar: _bottomBar());
  }

  _bottomBar() {
    double total = cartItems.length > 0
        ? cartItems
            .map<double>((m) => m.price)
            .reduce((value, element) => value + element)
        : 0;
    return Container(
      height: 180,
      child: Wrap(
        children: [
          Text("Total sum: $total"),
          Text("Total items: ${cartItems.length}"),
        ],
      ),
    );
  }
}
