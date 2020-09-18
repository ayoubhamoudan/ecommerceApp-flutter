class User {
  String id , name , email ;

  User(this.id, this.name, this.email);

  User.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['_id'];
    this.name = jsonObject['name'];
    this.email = jsonObject['email'];
  }
}