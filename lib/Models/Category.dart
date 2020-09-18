class Category {
  String id , name;

  Category(this.id , this.name);

  Category.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['_id'];
    this.name = jsonObject['name'];
  }
}