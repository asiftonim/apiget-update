import 'package:flutter/material.dart';

import '../Models/product.dart';
class ProductItem extends StatelessWidget {
   ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation:12,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(product.ProductName,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
          color: Colors.lightBlue
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
            Text("Price : ${product.UnitPrice}",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20
            ),),
            Text("Quantity : ${product.Qty}",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20
            ),),
            Text("Total price : ${product.TotalPrice}",style: TextStyle(
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
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit,color: Colors.white,),
                      Text("Edit",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18
                      ),
                      )
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
                      Icon(Icons.delete,color: Colors.white,),
                      Text("delete",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18
                        ),
                      )
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
