class productModel {
  String? id;
  String? brand;
  String? brandimage;
  String? title;
  String? description;
  String? price;
  String? image;
  String? category;

  productModel(
      {this.id,
      this.brand,
      this.brandimage,
      this.title,
      this.description,
      this.price,
      this.image,
      this.category});

  factory productModel.fromMap(Map<String, dynamic> e) {
    return productModel(
      id: e['id'],
      brand: e['brand'],
      brandimage: e['brandimage'],
      title: e['title'],
      description: e['description'],
      price: e['price'],
      image: e['image'],
      category: e['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'brandimage': brandimage,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
    };
  }

  static fromJson(item) {}
}
