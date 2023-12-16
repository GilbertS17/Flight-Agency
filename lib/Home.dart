import 'package:flutter/material.dart';
import 'page1.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Travel Agency",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 50,color: Colors.white)
            ),
            SizedBox(height: 30,),
            Text("Make your tour amazing with us!",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25,color: Colors.white)),
            SizedBox(height: 50,),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                    padding: MaterialStatePropertyAll(EdgeInsets.only(left: 25, right: 25,top: 10,bottom: 10))
                ),

                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Page1(),
                  ));
                },
                child: Text("Start", style: TextStyle(color: Colors.white, fontSize: 25),)
            )
          ],
        ),
      ),
    );
  }
}
