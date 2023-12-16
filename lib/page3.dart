import 'package:flutter/material.dart';
import 'package:travelagency/flights.dart';
import 'page1.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    Flight flight = ModalRoute.of(context)!.settings.arguments as Flight;

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Congratulations",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 50,color: Colors.white)
            ),
            SizedBox(height: 30,),
            Text("You just booked a flight",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25,color: Colors.white)),
            SizedBox(height: 50,),
            Text(flight.toString(),
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20,color: Colors.white)),
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
                child: Text("Go Back", style: TextStyle(color: Colors.white, fontSize: 25),)
            )
          ],
        ),
      ),
    );
  }
}
