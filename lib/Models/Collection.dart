class Collection {
  String id , name , image , description , title ;
  Collection(this.id, this.name, this.image, this.description , this.title);
  Collection.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['_id'];
    this.name = jsonObject['name'];
    this.image = jsonObject['image'];
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
  }
}