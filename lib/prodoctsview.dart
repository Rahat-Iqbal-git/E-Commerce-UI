import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsView extends StatefulWidget {
  final String docID;
  // final String collectionID;

  ProductsView(this.docID);

  // String id = product_name.toString();

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {

  getdocument(String name) async{
    DocumentSnapshot doc = await Firestore.instance.collection('name').document(widget.docID).get();
    // String productprice = doc["price"];
    // var doc = await 
    // Firestore.instance.collection('col').where('name', isEqualTo:name ).getDocuments().then((value) => null);
    // String abc = doc[];
  }

  

  addMethod() {
    //String id = uidreturn().toString();
    Map<String, dynamic> data = {
      "price": "900", "model": "Samsung Galaxy S20",
      // "userid":id
    };

    CollectionReference collectionReference =
        Firestore.instance.collection('details');
    collectionReference.add(data);
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    String id2 = this.addMethod();

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.docID.toString() + "s"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // widget.product_name.toString() == "LRaRpezGOIoPFaKmrStp"
              //     ? 
                  FutureBuilder(
                      future: Firestore.instance
                          .collection('Audi')
                          .document(widget.docID)
                          .get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        var data = snapshot.data;
                        return Column(
                          children: [
                            Image.network(data["image"]) ?? "NA",
                            // Text(data["title"])??"NA",

                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.only(top: 15),
                              // height: 240,
                              // width: size.width,
                              decoration: BoxDecoration(
                                color: Color(0xffEB984E),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: [
                                      //Text(doc["model"]),
                                      //Text(doc.data['name']),

                                      Text(
                                            data["title"],
                                            style: TextStyle(
                                              color: Colors.white,
                                              //fontFamily: ,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ) ??
                                          "NA",

                                      // Text(
                                      //   "Samsung abcde",
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //     //fontFamily: ,
                                      //     fontSize: 22,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 165,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          //shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                            child:
                                                //Text("Memory + "doc["memory"]" " ,
                                                Text(
                                          "Memory 8/256",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                      SizedBox(
                                        width: 28,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 165,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          //shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Text(
                                                  "Color",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.5,
                                  ),
                                  Text(
                                    "Details:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                        data['details'],
                                        //"Released 2019, August 23 \n168g, 7.9mm thickness \nAndroid 9.0 up to Android 11, One UI 3.1\n256GB storage, no card slot",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ) ??
                                      "NA",
                                ],
                              ),
                            ),

                            Container(
                                padding: EdgeInsets.only(left: 8),
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Price",
                                          style: TextStyle(
                                            color: Color(0xffEB984E),
                                            fontSize: 18,
                                          ),
                                        ),
                                        //SizedBox(height: 3,),
                                        Text(
                                          data['price'],
                                          style: TextStyle(
                                            color: Color(0xffEB984E),
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 165,
                                    ),
                                    InkWell(
                                      child: Container(
                                        height: 48,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: Color(0xffEB984E),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "ADD",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // onTap: addMethod(),
                                      //(){
                                      //print("Add was tapped");
                                      // ref.child().set({
                                      //   'price':900,
                                      // 'user':widget.get_user.email.toString(),
                                      // 'user':user.uid;
                                      // });
                                      //},
                                    ),
                                  ],
                                ))
                          ],
                        );
                      }),
                  // : Text(""),
              // widget.product_name.toString() == "MPYZ6fXHLJSIPR1mMrX8"
              //     ? FutureBuilder(
              //         future: Firestore.instance
              //             .collection('Audi')
              //             .document(widget.product_name.toString())
              //             .get(),
              //         builder: (BuildContext context,
              //             AsyncSnapshot<DocumentSnapshot> snapshot) {
              //           if (!snapshot.hasData) {
              //             return Center(child: CircularProgressIndicator());
              //           }
              //           if (snapshot.connectionState ==
              //               ConnectionState.waiting) {
              //             return Center(child: CircularProgressIndicator());
              //           }
              //           var data = snapshot.data;
              //           return Column(
              //             children: [
              //               Image.network(data["image"]) ?? "NA",
              //               Text(data["title"]) ?? "NA",
              //             ],
              //           );
              //         })
              //     : Text(""),
            ],
          ),
        ));
  }
}
