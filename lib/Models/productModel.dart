
class ProductModel {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  ProductModel({this.id, this.title, this.price, this.description, this.images, this.creationAt, this.updatedAt, this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    price = json["price"];
    description = json["description"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    creationAt = json["creationAt"];
    updatedAt = json["updatedAt"];
    category = json["category"] == null ? null : Category.fromJson(json["category"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["price"] = price;
    _data["description"] = description;
    if(images != null) {
      _data["images"] = images;
    }
    _data["creationAt"] = creationAt;
    _data["updatedAt"] = updatedAt;
    if(category != null) {
      _data["category"] = category?.toJson();
    }
    return _data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({this.id, this.name, this.image, this.creationAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    creationAt = json["creationAt"];
    updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["creationAt"] = creationAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}