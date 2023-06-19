import 'package:flutter/material.dart';
import 'package:barter_it/loginscreen.dart';
import 'package:barter_it/registerscreen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String maintitle = "Profile";
  int _currIndex = 2;

  @override
  void initState(){
    super.initState();
    print("Profile");
  }

  @override
  void dispose(){
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Flexible(
          flex: 4,
          child: Card(
            elevation: 10,
            child: Row(
              children: [
         
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    shrinkWrap: true,
                    children:  [
                      MaterialButton(
                    onPressed: (){
                      Navigator.push(context, 
      MaterialPageRoute(builder: (content) => const RegisterScreen()));
                    },
                    child: const Text("REGISTER",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                   const Divider(
                    height: 2,
                  ),

                   MaterialButton(
                    onPressed: (){
                      Navigator.push(context, 
      MaterialPageRoute(builder: (content) => const LoginScreen()));
                    },
                    child: const Text("LOG IN",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                   const Divider(
                    height: 2,
                  ),
                    ],
                  )
                  ),
              ], 
            ),
          ),
        )
      ]),
      //child: Text(maintitle),
    );
  }

}