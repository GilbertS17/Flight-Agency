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
   Flight("images/madrid.jpg", "Madrid", "Conference", "Fri 22 Jul", "Tues 26 Jul", 750),
   Flight("images/portugal.jpg", "Lisbon", "Festival", "Mon 12 Oct", "Wed 14 Oct", 700),
   Flight("images/scotland.jpg", "Edinburgh", "WRC", "Tue 4 Jun", "Tues 11 Jun", 850),
   Flight("images/france.jpg", "Paris", "Business Trip", "Tue 15 Nov", "Sun 20 Nov", 550),
   Flight("images/england.jpg", "Manchester", "CL Final", "Thu 16 Feb", "Mon 20 Feb", 800),
   Flight("images/canada.jpg", "Ottawa", "skiing", "Mon 20 Dec", "Mon 4 Jan", 1100),
];

List<String> plans = [
  "economic",
  "normal",
  "vip",

];