class Country {
  final String id;
  final String name;
  final String imagePath;

  Country({required this.id, required this.name, required this.imagePath});
}


enum CountryRegion {
  local,
  northAmerica,
  europe
}