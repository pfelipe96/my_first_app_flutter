class Beer {
  int id;
  String name;
  String imageUrl;

  Beer({this.id, this.name, this.imageUrl});

  Beer.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        imageUrl = jsonMap['image_url'];

}
