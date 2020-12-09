import 'package:flutter/material.dart';
import 'package:grocery_app/product.dart';

class ProductWidget extends StatefulWidget {
  Product product;

  ProductWidget({this.product});

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(15)),
      ),
      child: InkWell(
        child: Container(
          child: Column(
            children: [
              Image.asset(
                widget.product.imageUrl,
                height: 90,
                width: 140,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    widget.product.name + "\n" + widget.product.price,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                   child: IconButton(
                       icon: Icon(widget.product.isFaverate?
                           Icons.favorite_outlined:Icons.favorite_outline,color: Colors.amber,

                       ),
                       onPressed: () {
                         setState(() {
                           widget.product.isFaverate=!widget.product.isFaverate;

                         });
                       }),
                  ),
                ],
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 10.0, right: 10, top: 16, bottom: 3),
        ),
        onTap: () {},
      ),
    );
  }
}
