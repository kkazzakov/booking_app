class Room {
  final int id;
  final String name;
  final int price;
  final String pricePer;
  final List<String> peculiarities;
  final List<String> imageUrls;

  Room({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    final List<String> peculiaritiesList = List<String>.from(json['peculiarities']);
    final List<String> imageUrlsList = List<String>.from(json['image_urls']);

    return Room(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      pricePer: json['price_per'],
      peculiarities: peculiaritiesList,
      imageUrls: imageUrlsList,
    );
  }
}
