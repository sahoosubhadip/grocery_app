import 'package:flutter/material.dart';
import 'package:grocery_app/product.dart';
import 'package:grocery_app/product_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productList = [
    Product(imageUrl: "assets/tomato.png", name: 'Tamato', price: "Rs : 49/kg"),
    Product(imageUrl: "assets/corn.png", price: "Rs : 99/kg", name: "Corn")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFC400),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            icon: Image.asset(
                              'assets/menu1.png',
                              width: 25,
                              fit: BoxFit.cover,
                            ),
                            onPressed: () {}),
                        Text(
                          "    Grocery",
                          style: TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: IconButton(
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                size: 40,
                              ),
                              onPressed: () {}),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 10.0,
                    right: 10.0,
                    child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: ' Search Grocery',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFFFFC400),
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 18, bottom: 11, top: 11, right: 18),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -65,
                    left: 30.0,
                    right: 30.0,

                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: TabBar(
                        onTap: (index) {},
                        tabs: [
                          Tab(
                            text: "Vegetable",
                          ),
                          Tab(
                            text: "Fruits",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 60),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.9,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemBuilder: (_, index) {
                      Product product = productList[index];

                      return ProductWidget(
                        product: product,
                      );
                    },
                    itemCount: productList.length,
                    shrinkWrap: true,
                  )),
            ],
          ),
        ));
  }
}
