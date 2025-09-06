class HeroModel {
  final String name;
  final String image;
  final double speed, health, attack;

  HeroModel({
    required this.name,
    required this.image,
    required this.speed,
    required this.health,
    required this.attack,
  });
}

final List<HeroModel> heroes = [
  HeroModel(
    name: 'Bajaj N250',
    image: 'assets/n250.png',
    speed: 60.0,
    health: 63.0,
    attack: 65.0,
  ),
  HeroModel(
    name: 'Honda CB190R',
    image: 'assets/cb190r.png',
    speed: 52.0,
    health: 59.0,
    attack: 66.0,
  ),
  HeroModel(
    name: 'CFMoto 250NK',
    image: 'assets/250nk.png',
    speed: 68.0,
    health: 75.0,
    attack: 70.0,
  ),
];
