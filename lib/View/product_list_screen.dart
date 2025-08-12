import 'dart:convert';
import 'package:apicallall/View/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Models/product.dart';
import 'add_product.dart';

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
        leading:IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>AddProduct (),
            ),
          );
        }, icon:Icon(Icons.add,size: 30,)) ,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
              getProductList();
            }, icon:Icon(Icons.refresh,size: 30,)),
          )
        ],
        centerTitle: true,
      ),
      body:_inprogress ? Center(
        child: CircularProgressIndicator(),
      ) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(itemBuilder: (context, index) {
          return ProductItem( product: productList[index],);
        },
            separatorBuilder: (context, index) {
              return SizedBox(height: 20,);
            },
            itemCount: productList.length),
      ),
    );
  }


  List<Product> productList = [];
  bool _inprogress = false;

  void getProductList() async {
    setState(() {
      _inprogress = true;
    });

    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    Response response = await get(uri);

    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      for (var item in jsonResponse['data']) {
        productList.add(
          Product(
            id: item['_id'],
            ProductName: item['ProductName'] ?? '',
            ProductCode: item['ProductCode'] ?? '',
            Img: item['Img'] ?? '',
            UnitPrice: item['UnitPrice'] ?? '',
            Qty: item['Qty'] ?? '',
            TotalPrice: item['TotalPrice'] ?? '',
            CreatedDate: item['CreatedDate'] ?? '',
          ),
        );
      }
    } else {
      print("Error: ${response.statusCode}");
    }

    setState(() {
      _inprogress = false; // লোডিং শেষ
    });
  }


}
