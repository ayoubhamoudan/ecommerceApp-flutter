class Review {
  String id , title , description , user , product ;
  int rating ;

  Review(this.id, this.title, this.description, this.user, this.product,
      this.rating);
  Review.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['id'];
    this.description = jsonObject['description'];
    this.user = jsonObject['user'];
    this.product = jsonObject['product'];
    this.title = jsonObject['title'];
    this.rating = jsonObject['rating'];
  }
}