import 'package:flutter/material.dart';
import 'package:travelagency/page1.dart';
import 'flights.dart';
import 'page3.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  // late String plan;
  //
  // void initState() {
  // super.initState();
  // plan = plans[0];
  //
  // }

  @override
  Widget build(BuildContext context) {
    Flight flight = ModalRoute.of(context)!.settings.arguments as Flight;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
        body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(flight.location,
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 50,color: Colors.white)
            ),
            SizedBox(height: 30,),
            Text("Choose your plan of travel: ",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25,color: Colors.white)),
            SizedBox(height: 50),
            Container(
              color: Colors.white24,
              child: DropdownMenu(
                initialSelection: flights[0].plan,
                menuStyle: const MenuStyle(
                  backgroundColor:
                  MaterialStatePropertyAll(Colors.white60),
                ),
                width: 200 ,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
                dropdownMenuEntries:
                plans.map<DropdownMenuEntry<String>>((String plans) {
                  return DropdownMenuEntry(
                    value: plans,
                    label: plans,
                  );
                }).toList(),
                onSelected: (cls) {
                  setState(() {
                    flight.plan = cls as String;

                  });
                },
              ),
            ),

            SizedBox(height: 25,),

            Text("total cost: ${flight.getCost().toInt().toString()}",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20,color: Colors.white)),
            SizedBox(height: 25,),

            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                    padding: MaterialStatePropertyAll(EdgeInsets.only(left: 25, right: 25,top: 10,bottom: 10))
                ),

                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Page3(),
                    settings: RouteSettings(arguments: flight),
                  ));
                },
                child: Text("Confirm purchase", style: TextStyle(color: Colors.white, fontSize: 25),)
            ),

            SizedBox(height: 25),

            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                    padding: MaterialStatePropertyAll(EdgeInsets.only(left: 25, right: 25,top: 10,bottom: 10))
                ),

                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("Choose another offer", style: TextStyle(color: Colors.white, fontSize: 25),)
            ),
          ],
        ),
      ),
    );
  }
}
