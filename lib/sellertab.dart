import 'dart:convert';

import 'package:barter_it/newproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'config.dart';
import 'model/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SellerTab extends StatefulWidget {
  final User user;
  const SellerTab({Key? key, required this.user}): super(key: key);

  @override
  State<SellerTab> createState() => _SellerTabState();
}

class _SellerTabState extends State<SellerTab> {
  String maintitle = "Seller";
  int _currIndex = 1;
  List productlist = [];
  String titlecenter = "";

  @override
  void dispose(){
    super.dispose();
    print("dispose");
  }

    @override
  void initState() {
    super.initState();
    loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add),
            label: "New Product",
            labelStyle: const TextStyle(fontSize: 24, color: Colors.white),
            onTap: () => newProduct(),
          ),
        ],
      ),
    );
  }

  void newProduct(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>  NewProductScreen(user: widget.user,)));
  }

  loadProducts(){
    if(widget.user.email == "na"){
      setState(() {
        titlecenter = "Unregistered User";
      });
      return;
    }
    http.post(Uri.parse("${MyConfig().SERVER}/barter_it/php/loadproduct.php"),
    body: {
      "userid": widget.user.id
    }).then((response){
      print(response.body);

      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        if(data['status'] == 'success'){
          var extractdata = data['data'];
          setState(() {
            productlist = extractdata["products"];
            print(productlist);
          });
        }else{
          setState(() {
            titlecenter = "No Data";
          });
        }
      }
    });
  }
}