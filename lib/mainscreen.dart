import 'package:flutter/material.dart';
import 'package:barter_it/buyertab.dart';
import 'package:barter_it/profiletab.dart';
import 'package:barter_it/sellertab.dart';
import 'model/user.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late List<Widget> tabchildren;
  int _currIndex = 0;
  String maintitle = "Buyer";

  @override
  void initState(){
    super.initState();
    tabchildren = [
      BuyerTab(),
      SellerTab(user: widget.user),
      ProfileTab(),
    ];
  }

  @override
  void dispose(){
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(maintitle),),
      body: tabchildren[_currIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.money,),
              label: "Buyer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.store_mall_directory, ),
              label: "Seller"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, ), label: "Profile")
        ],
      ),
    );
  }

  void onTabTapped(int value) {
    setState(() {
      _currIndex = value;
      if(_currIndex == 0){
        maintitle = "Buyer";
      }
      if(_currIndex == 1){
        maintitle = "Seller";
      }
      if(_currIndex == 2){
        maintitle = "Profile";
      }
    });
  }
}