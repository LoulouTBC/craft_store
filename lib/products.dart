import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wadi_alarab/page_route.dart';
import 'package:wadi_alarab/product_datail_screen.dart';
import 'package:wadi_alarab/product_item.dart';
import 'package:wadi_alarab/product_model.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  Future<List<Product>> fetchData() async {
    try {
      var response = await Dio().get(
          'https://tameed.org/wadi_alarab/wadi_al_arab/public/api/get_products');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Product> products =
            data.map((item) => Product.fromJson(item)).toList();
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setStringList(
            'products', products.map((p) => p.toJson().toString()).toList());
        return products;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Product> products = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      AnimationRoute(
                        page: ProductDetailScreen(product: products[index]),
                      ),
                    );
                  },
                  child: ProductItem(product: products[index]),
                );
              },
            ),
          );
        }
      },
    );
  }
}
