import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  bool _inprogress = false;

  void _onTapAddProductButton(){
    if (_formKey.currentState!.validate()) {
      addNewProduct();
    }
  }

  Future<void>addNewProduct()async {
    _inprogress = true;
    setState(() {
    });
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
    Map<String,dynamic> requstBody = {
      "Img":_productImageController.text,
      "ProductCode":_productCodeController.text,
      "ProductName":_productNameController.text,
      "Qty":_quantityController.text,
      "TotalPrice":_totalPriceController.text,
      "UnitPrice":_unitPriceController.text
    };
    Response response = await post(uri,
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(requstBody));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode==200){
      
    }

  }

  @override
  void dispose() {
    _productNameController.dispose();
    _unitPriceController.dispose();
    _totalPriceController.dispose();
    _productImageController.dispose();
    _productCodeController.dispose();
    _quantityController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Post data to API"),
      ),
      body: _buildNewProductForm(),
    );
  }
  Widget _buildNewProductForm(){
    return Form(
      key: _formKey,
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (String?value){
                    if (value == null || value.isEmpty){
                      return 'Enter a valid valur';
                    }
                    return null;
                  },
                  controller: _productNameController,
                  decoration: InputDecoration(
                    hint: Text("Product name", style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                    ),),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                  ),
                ),SizedBox(height: 20,),
                TextFormField(
                  validator: (String?value){
                    if (value == null || value.isEmpty){
                      return 'Enter a valid valur';
                    }
                    return null;
                  },

                  controller: _unitPriceController,
                  decoration: InputDecoration(
                    hint: Text("Unit price", style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                    ),),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                  ),
                ),SizedBox(height: 20,),
                TextFormField(
                  validator: (String?value){
                    if (value == null || value.isEmpty){
                      return 'Enter a valid valur';
                    }
                    return null;
                  },
                  controller: _totalPriceController,
                  decoration: InputDecoration(
                    hint: Text("Total price", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,

                    ),),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                  ),
                ),SizedBox(height: 20,),
                TextFormField(
                  validator: (String?value){
                    if (value == null || value.isEmpty){
                      return 'Enter a valid valur';
                    }
                    return null;
                  },
                  controller: _productImageController ,
                  decoration: InputDecoration(
                    hint: Text("Product image", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                  ),
                ),SizedBox(height: 20,),
                TextFormField(
                  validator: (String?value){
                    if (value == null || value.isEmpty){
                      return 'Enter a valid valur';
                    }
                    return null;
                  },
                  controller: _productCodeController,
                  decoration: InputDecoration(
                    hint: Text("Product code", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                  ),
                ),SizedBox(height: 20,),
                TextFormField(
                  validator: (String?value){
                    if (value == null || value.isEmpty){
                      return 'Enter a valid valur';
                    }
                    return null;
                  },
                  controller:_quantityController ,
                  decoration: InputDecoration(
                    hint: Text("quantity", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                  ),
                ),
                SizedBox(height: 250,),
                GestureDetector(onTap: _onTapAddProductButton,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.teal
                    ),child: Center(child: Text("Add Product",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                  ),)),
                  ),
                )
              ],
            ),
          ),
        ) );
  }
}
