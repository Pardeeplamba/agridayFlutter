import 'package:agriday/constants.dart';
import 'package:flutter/material.dart';
class FruitFile extends StatelessWidget {
  final String product,seller,variety,delivery;
    final  int price,avgweigth,perbox,boxes;



  FruitFile({required this.product,required this.seller,required this.variety, required this.price,required this.avgweigth,
    required this.perbox,required this.boxes,required this.delivery});

  Widget toptext(String productname){
    return  Align(
      alignment: Alignment.centerLeft,
      child: Column(children: [
        Text(productname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        Text("Product")
      ],),
    );
  }

  Widget toptextsecond(String variety){
    return  Column(children: [
      Text(variety,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
      Text("Variety")
    ],);
  }
  Widget bottomtext(int avgweigth){
    return  Column(children: [
      Text(avgweigth.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      Text("avg weigth")
    ],);
  }
  Widget bottomtextsecond(int perbox){
    return  Column(children: [
      Text(perbox.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      Text("per Box")
    ],);
  }
  Widget bottomtextthird(int boxes){
    return  Column(children: [
      Text(boxes.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      Text("Boxes")
    ],);
  }
  Widget bottomtextfourth(String delivery){
    return  Container(
      child: Column(children: [
        Align(
            alignment:Alignment.centerLeft,
            child: Text(delivery,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)),
        Align(
            alignment: Alignment.centerLeft,
            child: Text("Delivery"))
      ],),
    );
  }
  Widget topforth(){
    return Column(children: [
SizedBox(height: 5,)  ,    SizedBox(height: 5,)
    ],);
  }
Widget topthird(int price){
    return Column(
      children: [
        ClipRRect(

          borderRadius: BorderRadius.all(Radius.circular(10)
            
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
              color: Colors.green.withOpacity(0.2),
              child: Text("₹"+price.toString(),style: TextStyle(color: Colors.green,fontSize: 18),)),
        ),
        Text("")
      ],
    );
}
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(children: [
Container(

  padding: EdgeInsets.all(15),
  child: Text(seller),color: Colors.white,
width: double.infinity,),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child:Column(children: [Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
toptext(product) ,
toptextsecond(variety),
            topthird(price),
            topforth()


          ],

        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            bottomtext(avgweigth),
            bottomtextsecond(perbox),
            bottomtextthird(boxes),
            bottomtextfourth(delivery)
          ],

          ),
            ],),
        ),




      ],),
    );
  }
}
