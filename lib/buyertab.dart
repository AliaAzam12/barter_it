import 'package:flutter/material.dart';

class BuyerTab extends StatefulWidget {
  const BuyerTab({super.key});

  @override
  State<BuyerTab> createState() => _BuyerTabState();
}

class _BuyerTabState extends State<BuyerTab> {
  String maintitle = "Buyer";
  int _currIndex = 0;

  @override
  void initState(){
    super.initState();
    print("Buyer");
  }

  @override
  void dispose(){
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(maintitle),
    );
  }
}