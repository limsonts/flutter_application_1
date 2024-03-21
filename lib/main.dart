import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/product.dart';
import 'package:flutter_application_1/product_cubit.dart';
import 'package:flutter_application_1/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "XXX",
      appId: "XXX",
      messagingSenderId: "XXX",
      projectId: "XXX",
  ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Management',
      home: BlocProvider(
        create: (context) => ProductBloc()..fetchProducts(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Management'),
      ),
      body: BlocBuilder<ProductBloc, List<Product>>(
        builder: (context, productList) {
          return ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              final Product product = productList[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('Price: \$${product.price}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductForm()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}