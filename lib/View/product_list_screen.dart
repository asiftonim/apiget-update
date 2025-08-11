import 'dart:convert';

import 'package:apicallall/View/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Models/product.dart';

class ProductListScreen extends StatefulWidget {

  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ApI get & Update"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add,size: 40,),
          )
        ],
        centerTitle: true,
      ),
      body: ListView.separated(itemBuilder: (context, index) {
        return ProductItem( product: productList[index],);
      },
          separatorBuilder: (context, index) {
            return SizedBox(height: 5,);
          },
          itemCount: productList.length),
    );
  }


  List<Product> productList = [];

  void getProductList() async {
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    Response response = await get(uri);
    print(response);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']) {
        Product product = Product(
          id: item['_id'],
          ProductName: item['ProductName'],
          ProductCode: item['ProductCode'],
          Img: item['Img'],
          UnitPrice: item['UnitPrice'],
          Qty: item['Qty'],
          TotalPrice: item['_id'],
          CreatedDate: item['_id'],
        );
        productList.add(product);
      }
    }setState(() {

    });
  }
}
