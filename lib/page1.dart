import 'package:flutter/material.dart';
import 'flights.dart';
import 'page2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      // appBar: AppBar(title: Text("Flights"), centerTitle: true),
      // body: Column(
      //   children: [
      //     SizedBox(height: 50),
      //     Container(
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.only(
      //               topLeft: Radius.circular(10),
      //               topRight: Radius.circular(10),
      //               bottomLeft: Radius.circular(10),
      //               bottomRight: Radius.circular(10)
      //           ),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey.withOpacity(0.3),
      //               spreadRadius: 0,
      //               blurRadius: 10,
      //               offset: Offset(0, 0), // changes position of shadow
      //             ),
      //           ],
      //       ),
      //       child: Column(
      //         children: [
      //           planeCard(
      //               image: flights[0].image,
      //               location: flights[0].location,
      //               event: flights[0].event,
      //               stDate: flights[0].stDate,
      //               endDate: flights[0].endDate,
      //               cost: flights[0].cost,
      //             flight: flights[0],
      //           ),
      //           SizedBox(height: 1),
      //           planeCard(
      //             image: flights[1].image,
      //             location: flights[1].location,
      //             event: flights[1].event,
      //             stDate: flights[1].stDate,
      //             endDate: flights[1].endDate,
      //             cost: flights[1].cost,
      //             flight: flights[1],
      //           ),
      //           SizedBox(height: 1),
      //           planeCard(
      //             image: flights[2].image,
      //             location: flights[2].location,
      //             event: flights[2].event,
      //             stDate: flights[2].stDate,
      //             endDate: flights[2].endDate,
      //             cost: flights[2].cost,
      //             flight: flights[2],
      //           ),
      //           SizedBox(height: 1),
      //           planeCard(
      //             image: flights[3].image,
      //             location: flights[3].location,
      //             event: flights[3].event,
      //             stDate: flights[3].stDate,
      //             endDate: flights[3].endDate,
      //             cost: flights[3].cost,
      //             flight: flights[3],
      //           ),
      //           SizedBox(height: 1),
      //           planeCard(
      //             image: flights[4].image,
      //             location: flights[4].location,
      //             event: flights[4].event,
      //             stDate: flights[4].stDate,
      //             endDate: flights[4].endDate,
      //             cost: flights[4].cost,
      //             flight: flights[4],
      //           ),SizedBox(height: 1),
      //           planeCard(
      //             image: flights[5].image,
      //             location: flights[5].location,
      //             event: flights[5].event,
      //             stDate: flights[5].stDate,
      //             endDate: flights[5].endDate,
      //             cost: flights[5].cost,
      //             flight: flights[5],
      //           ),
      //           // planeCard(),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    appBar: AppBar(actions: [
      IconButton(onPressed: () {
        setState(() {
          print(flights);
          updateProducts(); // update data asynchronously
        });
        }, icon: const Icon(Icons.refresh)),
    ],
      title: const Text('Available flights'),
    ),
      body: ShowFlights(),
    );
  }
}


// class planeCard extends StatelessWidget {
//   final String image;
//   final String location;
//   final String event;
//   final String stDate;
//   final String endDate;
//   final double cost;
//   final Flight flight;
//
//   const planeCard({
//     super.key,
//     required this.image,
//     required this.location,
//     required this.event,
//     required this.stDate,
//     required this.endDate,
//     required this.cost,
//     required this.flight,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return  Center(
//         child: Container(
//             width: 350,
//             height: 100,
//             color: Colors.white,
//             child: TextButton(
//               onPressed: (){
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => const Page2(),
//                     settings: RouteSettings(arguments: flight)));
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     child: Image(
//                       height: 120, width: 120,
//                       image: AssetImage(image),
//
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("${location} ${event}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                       Text("${stDate} - ${endDate}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
//                       SizedBox(height: 10),
//                       Text("cost: from \$${(cost*0.9).toInt()} to \$${(cost*1.1).toInt()}", style: TextStyle(color: Colors. grey,fontWeight: FontWeight.w300)),
//                     ],
//                   ),
//                   SizedBox(width: 7),
//                 ],
//               ),
//           )
//     ),
//     );
//   }
// }