import 'package:flutter/material.dart';
import 'package:flutter_application_1/product_cubit.dart';
import 'package:flutter_application_1/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String name = _nameController.text.trim();
                final double price = double.parse(_priceController.text.trim());
                final Product product = Product(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: name,
                  price: price,
                );
                BlocProvider.of<ProductBloc>(context).addProduct(product);
                Navigator.pop(context);
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}