import 'package:agriday/constants.dart';
import 'package:agriday/homescreen.dart';
import 'package:agriday/widgets/fruitfile.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class NextScreen extends StatefulWidget {
  final String product, seller, variety, delivery;
  final int price, avgweigth, perbox, boxes;

  NextScreen(
      {required this.product,
      required this.seller,
      required this.variety,
      required this.price,
      required this.avgweigth,
      required this.perbox,
      required this.boxes,
      required this.delivery});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.bgColor,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          widget.seller,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(

        child: Column
          (
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Lot Details",
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Constant.listbgColor,
                clipBehavior: Clip.antiAlias,
                child: FruitFile(
                  product: widget.product,
                  seller: widget.seller,
                  variety: widget.variety,
                  price: widget.price,
                  avgweigth: widget.avgweigth,
                  perbox: widget.perbox,
                  boxes: widget.boxes,
                  delivery: widget.delivery,
                ),
              ),
            ),
            Expanded(
              child:SingleChildScrollView(
              child: Container(

                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   _messagereceive("Hello Buyer we have Apple ready to ship"),
                    SizedBox(
                      height: 5,
                    ),
                    _messagereceive("Do let me know"),
                    SizedBox(height: 10,),
                   _messagesent("How fast can you deliver?"),
                    SizedBox(height: 20,),

                  ],
                ),
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextField(
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  _messagesent(String text)
  {
    return  Align(
      alignment: Alignment.centerRight,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.green,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _messagereceive(String text)
  {
    return Align(
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Text(text),
        ),
      ),
    );
  }
}
