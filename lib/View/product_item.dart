import 'package:flutter/material.dart';

import '../Models/product.dart';
class ProductItem extends StatelessWidget {
   ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(product.ProductName,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35
        ),),
        subtitle: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Product code : ${product.ProductCode}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20
              ),
            ),
            Text("Price : ${product.Img}",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20
            ),),
            Text("Quantity : ${product.UnitPrice}",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20
            ),),
            Text("Total price : ${product.CreatedDate}",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20
            ),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit),
                      Text("Edit")
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete),
                      Text("delete")
                    ],
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
