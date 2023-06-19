import 'package:barter_it/newproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'model/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SellerTab extends StatefulWidget {
  final User user;
  const SellerTab({Key? key, required this.user}): super(key: key);

  @override
  State<SellerTab> createState() => _SellerTabState();
}

class _SellerTabState extends State<SellerTab> {
  String maintitle = "Seller";
  int _currIndex = 1;

  @override
  void initState(){
    super.initState();
    print("Seller");
  }

  @override
  void dispose(){
    super.dispose();
    print("dispose");
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
}