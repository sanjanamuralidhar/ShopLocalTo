

class NeighbourModel {
  int id;
  String location;
  String subtitle;
  String title;
  String description;



  NeighbourModel({
    this.id,
   this.location,
   this.subtitle,
   this.title,
   this.description,
  });
}

List<NeighbourModel> neighbourModels = [
  NeighbourModel(
    id:1,
    subtitle: "Arts and Humanities",
    title: "Michigan",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "Michigan",


  ),
  NeighbourModel(
   id:2,
    subtitle: "Arts and Humanities",
    title: "Colarado",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "Colarado",
    ),
  NeighbourModel(
    id:3,
    subtitle: "Arts and Humanities",
    title: "Utah",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "Utah",
    
  ),
  NeighbourModel(
  id:4,
    subtitle: "Arts and Humanities",
    title: "King Utah",
    description: "urban neighbourhood, lot to explore make your day good",
    location: "King Utah",
      ),
];
