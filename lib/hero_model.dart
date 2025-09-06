class HeroModel {
  final String name;
  final String image;
  final String description;
  final double speed, health, attack;

  HeroModel({
    required this.name,
    required this.image,
    required this.description,
    required this.speed,
    required this.health,
    required this.attack,
  });
}

final List<HeroModel> heroes = [
  HeroModel(
    name: 'Bajaj N250',
    image: 'assets/n250.png',
    description:
        'La Pulsar N250 lleva el legado streetfighter a un nuevo nivel con su diseño agresivo y musculoso. Equipada con un potente motor y una estética afilada, ofrece una experiencia de conducción emocionante y llena de adrenalina, ideal para dominar el asfalto de la ciudad con un rendimiento superior.',
    speed: 60.0,
    health: 63.0,
    attack: 65.0,
  ),
  HeroModel(
    name: 'Honda CB190R',
    image: 'assets/cb190r.png',
    description:
        'Conocida por su agilidad urbana y la legendaria fiabilidad de Honda. La CB190R es la compañera perfecta para la ciudad, ofreciendo una conducción ágil y un diseño deportivo que no pasa desapercibido. Su postura de manejo cómoda la hace ideal tanto para el tráfico diario como para escapadas de fin de semana.',
    speed: 52.0,
    health: 59.0,
    attack: 66.0,
  ),
  HeroModel(
    name: 'CFMoto 250NK',
    image: 'assets/250nk.png',
    description:
        'La 250NK irrumpe en la escena con un diseño naked vanguardista y tecnología de punta. Ligera, potente y equipada con componentes de alta calidad, esta moto ofrece una experiencia de conducción deportiva y precisa. Es la elección perfecta para quienes buscan un rendimiento excepcional y un estilo afilado y moderno.',
    speed: 68.0,
    health: 75.0,
    attack: 70.0,
  ),
];
