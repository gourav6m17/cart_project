import 'package:cart_project/model/product_model.dart';
import 'package:flutter/material.dart';

_CustomerCartState? customerCartState;

class CustomerCart extends StatefulWidget {
  final List<Product> products;

  /// This will be products, those user added to cart on previous screen
  const CustomerCart({Key? key, required this.products}) : super(key: key);

  @override
  _CustomerCartState createState() {
    customerCartState = _CustomerCartState();
    return customerCartState!;
  }
}

class _CustomerCartState extends State<CustomerCart> {
  @override
  Widget build(BuildContext context) {
    double total = widget.products.length > 0
        ? widget.products
        .map<double>((m) => m.price * m.count)
        .reduce((value, element) => value + element)
        : 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.products.length,
              itemBuilder: (context, int index) {
                final product = widget.products[index];
                return ProductItem(
                  currentIndex: index,
                  product: product,
                );
              },
            ),
            Text("Total price: $total")
          ],
        ),
      ),
    );
  }
}

/// Creating new widget for individual product. So we can change count.
class ProductItem extends StatefulWidget {
  final Product product;
  final int currentIndex;

  const ProductItem(
      {Key? key, required this.product, required this.currentIndex})
      : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int itemCounter = 1;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(widget.product.title),
      subtitle: Text(widget.product.description),
      trailing: _itemCount(widget.product, widget.currentIndex),
    );
  }

  Widget _itemCount(Product product, int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.remove),
            color: itemCounter > 1 ? null : Colors.grey,
            onPressed: () {
              setState(() {
                if (itemCounter > 1) {
                  itemCounter--;
                }
              });
              customerCartState!.setState(
                () {
                  customerCartState!.widget.products[index].count =
                      itemCounter;
                },
              );
            }),
        Text(itemCounter.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              itemCounter++;
            });
            customerCartState!.setState(
                  () {
                customerCartState!.widget.products[index].count =
                    itemCounter;
              },
            );
            print(itemCounter);
          },
        ),
      ],
    );
  }
}
