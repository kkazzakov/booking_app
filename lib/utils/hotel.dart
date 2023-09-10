class Hotel {
  final int id;
  final String name;
  final String address;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final HotelDescription aboutTheHotel;

  Hotel({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });
}

class HotelDescription {
  final String description;
  final List<String> peculiarities;

  HotelDescription({
    required this.description,
    required this.peculiarities,
  });
}
