import 'package:flutter/material.dart';
class FruitWidget extends StatelessWidget {
  final String fruitname,fruitimage;

  FruitWidget({required this.fruitname,required this.fruitimage});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            child: Card(
            elevation: 0,
clipBehavior: Clip.antiAlias,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              child: Image(image: AssetImage("assets/image"+fruitimage+".png"),)),
          ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(fruitname,textAlign: TextAlign.start,)),

        ],
      ),
    );
  }
}
