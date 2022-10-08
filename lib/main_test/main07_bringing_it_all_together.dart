import 'package:flutter/material.dart';

class Product {
  const Product({required this.name});
  final String name;
}

typedef CartChangedCallback = Function(Product product, bool intCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem(
      {required this.product,
      required this.inCart,
      required this.onCartChanged})
      : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyel(BuildContext context) {
    if (!inCart) return null;
    return const TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
          backgroundColor: _getColor(context), child: Text(product.name[0])),
      title: Text(product.name, style: _getTextStyel(context)),
    );
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  const ShoppingList({required this.products, Key? key}) : super(key: key);

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping cart')),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: widget.products.map((product) {
            return ShoppingListItem(
                product: product,
                inCart: _shoppingCart.contains(product),
                onCartChanged: _handleCartChanged);
          }).toList()),
    );
  }
}

void main_07(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Shopping App',
    home: ShoppingList(
      products: [
        Product(name: "Eggs"),
        Product(name: "Flout"),
        Product(name: "Chocolate chips"),
      ],
    ),
  ));
}
