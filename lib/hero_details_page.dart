import 'package:flutter/material.dart';
import 'package:practica1/hero_model.dart';

class HeroDetailsPage extends StatefulWidget {
  final HeroModel hero;

  const HeroDetailsPage(this.hero, {Key? key}) : super(key: key);

  @override
  State<HeroDetailsPage> createState() => _HeroDetailsPageState();
}

class _HeroDetailsPageState extends State<HeroDetailsPage> {
  final double appBarHeight = 80.0;

  late ScrollController _scrollController;

  double toolbarOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset <= appBarHeight) {
          toolbarOpacity =
              (appBarHeight - _scrollController.offset) / appBarHeight;
        } else {
          toolbarOpacity = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF4E342), Color(0xFFEE3474)],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(top: appBarHeight),
              children: [
                _HeroDetailsImage(widget.hero),
                _HeroDetailsName(widget.hero.name),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
                  child: Text(
                    "Super smash bros ultimate villagers from the animal crossing series. This troops fight most effectively in large group",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    const SizedBox(width: 28),
                    Expanded(
                      child: SizedBox(
                        height: 54,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Add Favourite',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0),
                            ),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF29758), Color(0xFFEF5D67)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(80.0),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'OK',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 28),
                  ],
                ),
                const SizedBox(height: 28),
              ],
            ),
            SafeArea(
              child: Opacity(
                opacity: toolbarOpacity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 18),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Text(
                      'Overview',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: SizedBox(height: appBarHeight)),
                    SizedBox(
                      width: appBarHeight,
                      height: appBarHeight,
                      child: const Icon(Icons.menu, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroDetailsImage extends StatelessWidget {
  final HeroModel hero;

  const _HeroDetailsImage(this.hero, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, left: 28.0, right: 28.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(28)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(28)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: const BorderRadius.all(Radius.circular(28)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Hero(tag: hero.name, child: Image.asset(hero.image)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroDetailsName extends StatelessWidget {
  final String heroName;

  const _HeroDetailsName(this.heroName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      height: 86,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Text(
            heroName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(
              heroName,
              style: TextStyle(
                color: Colors.white.withOpacity(0.1),
                fontWeight: FontWeight.bold,
                fontSize: 56,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
