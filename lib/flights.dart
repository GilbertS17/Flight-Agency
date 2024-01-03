import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'page2.dart';

// main URL for REST pages
const String _baseURL = 'gilbert10452.000webhostapp.com';

class Flight{
   String image = "";
   String location = "";
   String event = "";
   String stDate = "";
   String endDate = "";
   double cost = 0;
   String plan = plans[1];

   Flight(this.image, this.location, this.event, this.stDate, this.endDate,
      this.cost);

   double getCost(){
      if(plan == "economic") return (cost*0.9);
      else if(plan == "normal") return (cost);
      else return (cost*1.1);
   }

   @override
  String toString() {
    return '''
Location: $location,
Event: $event,
Start Date: $stDate,
End Date: $endDate,
Plan: $plan
Price: ${getCost().toInt()}
''';
  }
}

List<Flight> flights = [
   // Flight("images/madrid.jpg", "Madrid", "Conference", "Fri 22 Jul", "Tues 26 Jul", 750),
   // Flight("images/portugal.jpg", "Lisbon", "Festival", "Mon 12 Oct", "Wed 14 Oct", 700),
   // Flight("images/scotland.jpg", "Edinburgh", "WRC", "Tue 4 Jun", "Tues 11 Jun", 850),
   // Flight("images/france.jpg", "Paris", "Business Trip", "Tue 15 Nov", "Sun 20 Nov", 550),
   // Flight("images/england.jpg", "Manchester", "CL Final", "Thu 16 Feb", "Mon 20 Feb", 800),
   // Flight("images/canada.jpg", "Ottawa", "skiing", "Mon 20 Dec", "Mon 4 Jan", 1100),
];

List<String> plans = [
  "economic",
  "normal",
  "vip",
];

void updateProducts() async {
  try {
    final url = Uri.https(_baseURL, '/getFlights.php');
    final response = await http
        .get(url)
        .timeout(const Duration(seconds: 5)); // max timeout 5 seconds
    flights.clear(); // clear old products
    if (response.statusCode == 200) {
      // if successful call
      final jsonResponse = convert.jsonDecode(response.body); // create dart json object from json array
      for (var row in jsonResponse) {
        // iterate over all rows in the json array
        Flight f = Flight(
          // create a product object from JSON row object
          // this.image, this.location, this.event, this.stDate, this.endDate, this.cost
            row['image'],
            row['location'],
            row['event'],
            row['stDate'],
            row['endDate'],
            double.parse(row['cost']));
        flights.add(f); // add the product object to the _products list
      }
    }
  } catch (e) {

  }
}

class ShowFlights extends StatelessWidget {
  const ShowFlights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: flights.length,
      itemBuilder: (context, index) => Container(
          color: index % 2 == 0 ? Colors.amber : Colors.cyan,
          padding: const EdgeInsets.all(5),
          child: Container(
            width: 350,
            height: 100,
            color: Colors.white,
            child: TextButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Page2(),
                    settings: RouteSettings(arguments: flights[index])));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Image(
                      height: 120, width: 120,
                      image: AssetImage(flights[index].image),

                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${flights[index].location} ${flights[index].event}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      Text("${flights[index].stDate} - ${flights[index].endDate}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
                      SizedBox(height: 10),
                      Text("cost: from \$${(flights[index].cost*0.9).toInt()} to \$${(flights[index].cost*1.1).toInt()}", style: TextStyle(color: Colors. grey,fontWeight: FontWeight.w300)),
                    ],
                  ),
                  SizedBox(width: 7),
                ],
              ),
          )
    ),
      ),
    );
  }
}