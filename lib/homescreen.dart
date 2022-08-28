import 'package:agriday/constants.dart';
import 'package:agriday/nextscreen.dart';
import 'package:agriday/widgets/fruitfile.dart';
import 'package:agriday/widgets/fruitsimageandtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List mydata = [];
  List searchData = [];
  TextEditingController textEditingController = new TextEditingController();
  final List _fruitsnamelist = [
    "Apple",
    "Mango",
    "Grapes",
    "Watermelon",
    "Lemon"
  ];
  final List _fruitsimagelist = ["1", "2", "3", "4", "5"];


  onSearchTextChanged(String text) async {
    searchData.clear();
    if (text.isEmpty) {
      // Check textfield is empty or not
      setState(() {});
      return;
    }

    mydata.forEach((data) {
      if (data['Seller']
          .toString()
          .toLowerCase()
          .contains(text.toLowerCase().toString())) {
        searchData.add(
            data); // If not empty then add search data into search data list
      }
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.bgColor,
      appBar: AppBar(
        toolbarHeight: 120,
        elevation: 0,
        backgroundColor: Constant.bgColor,
        title: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
          alignment: Alignment.topLeft,
          child: Text('Buy',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
               SizedBox(height: 10,),
               Container(
                 child: Row(
                     children: [
                                Expanded(
                                  child: Card(
                                    color: Colors.white,
                    elevation: 1,
                    child: ListTile(

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        title: TextField(
decoration: InputDecoration(hintText: "Search",icon: Icon(Icons.search),),
                          controller: textEditingController,
                          onChanged: onSearchTextChanged,
                        ),

                    ),

              ),
                                ),
Container(
  margin: EdgeInsets.symmetric(horizontal: 15),
  child: GestureDetector(
                  onTap: () {
                  _showbanner();
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.sort,
                        color: Colors.black,
                      ),
                      Text(
                        "Sort",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),

                      )
                    ],
                  ),
              ),
),
                   ]),
               ),
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 120,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return FruitWidget(
                    fruitname: _fruitsnamelist[index],
                    fruitimage: _fruitsimagelist[index],
                  );
                },
                itemCount: _fruitsnamelist.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Flexible(
              child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/fruits.json'),
                  builder: (context, snapshot) {
                    mydata = json.decode(snapshot.data.toString());
                    return mydata==null ?
                    CircularProgressIndicator():
                    searchData.length == 0
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              return _listItem(index, mydata);
                            },
                            itemCount: mydata.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              return _listItem(index, searchData);
                            },
                            itemCount: searchData.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                          );
                  }),
            ),
          ],
        )),
      ),
    );
  }
_showbanner(){
    return   showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          // we set up a container inside which
          // we create center column and display text

          // Returning SizedBox instead of a Container
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Name'),
                  GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                          margin: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_upward,))),
                  Icon(Icons.arrow_downward),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Price'),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: Icon(Icons.arrow_upward)),
                  Icon(Icons.arrow_downward),
                ],
              ),
            ],
          );
        });
}
  _listItem(index, mydata) {
    return Container(
      margin: EdgeInsets.all(5),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    elevation: 1,
    color: Constant.listbgColor,
    clipBehavior: Clip.antiAlias,
      child: InkWell(
        
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => NextScreen(
                        product: mydata[index]['Product'],
                        seller: mydata[index]['Seller'],
                        variety: mydata[index]['Variety'],
                        price: mydata[index]['Price'],
                        avgweigth: mydata[index]['AvgWeight'],
                        boxes: mydata[index]['Boxes'],
                        delivery: mydata[index]['Delivery'],
                        perbox: mydata[index]['PerBox'],
                      )));
        },
        child: FruitFile(
          product: mydata[index]['Product'],
          seller: mydata[index]['Seller'],
          variety: mydata[index]['Variety'],
          price: mydata[index]['Price'],
          avgweigth: mydata[index]['AvgWeight'],
          boxes: mydata[index]['Boxes'],
          delivery: mydata[index]['Delivery'],
          perbox: mydata[index]['PerBox'],
        ),
      ),
    ),
    );
  }
}
