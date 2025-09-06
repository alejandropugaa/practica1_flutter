import 'package:flutter/material.dart';
import 'package:practica1/attribute_widget.dart';
import 'package:practica1/hero_details_page.dart';
import 'dart:math' as math;

import 'hero_model.dart';

double radians(double degrees) => degrees * (math.pi / 180.0);

class HeroRowWidget extends StatelessWidget {
  final HeroModel hero;
  final double rowHeight;

  final String speed = 'assets/velocidad.png';
  final String heart = 'assets/piston.png';
  final String knife = 'assets/llanta.png';

  const HeroRowWidget({Key? key, required this.hero, this.rowHeight = 282})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: rowHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: const Offset(-10, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(radians(1.5)),
              child: Container(
                height: 216,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(-44, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(radians(8)),
              child: Container(
                height: 188,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: const Offset(-30, 0),
              child: Hero(
                tag: hero.name,
                child: Image.asset(
                  hero.image,
                  width: rowHeight,
                  height: rowHeight,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 58),
              padding: const EdgeInsets.symmetric(vertical: 34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AttributeWidget(
                    progress: hero.speed,
                    child: Image.asset(speed),
                  ),
                  AttributeWidget(
                    progress: hero.health,
                    child: Image.asset(heart),
                  ),
                  AttributeWidget(
                    progress: hero.attack,
                    child: Image.asset(knife),
                  ),
                  SizedBox(
                    height: 32,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HeroDetailsPage(hero),
                          ),
                        );
                      },
                      child: const Text(
                        'See Details',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
