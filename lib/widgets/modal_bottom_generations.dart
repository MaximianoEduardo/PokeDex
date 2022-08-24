import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ModalBottomGenerations extends StatelessWidget {
  const ModalBottomGenerations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Generations',
            style: Theme.of(context).textTheme.headline3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Use search for generations to explore your Pokémon!',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: SizedBox(
              height: 300,
              child: GridView.count(
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                crossAxisCount: 2,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: const Color.fromRGBO(242, 242, 242, 1),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/generations/generation1/001.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Image.asset(
                                    'assets/generations/generation1/004.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Image.asset(
                                    'assets/generations/generation1/007.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Text('Generation I'),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          left: 15,
                          child: SvgPicture.asset(
                            'assets/patterns/6x3.svg',
                            color: Colors.white.withOpacity(0.3),
                            width: 80,
                            height: 35,
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          right: 0,
                          child: SvgPicture.asset(
                            'assets/patterns/pokeball.svg',
                            color: Colors.white.withOpacity(0.3),
                            width: 110,
                            height: 110,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: const Color.fromRGBO(242, 242, 242, 1),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/generations/generation2/152.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Image.asset(
                                    'assets/generations/generation2/155.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Image.asset(
                                    'assets/generations/generation2/158.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Text('Generation II'),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          left: 15,
                          child: SvgPicture.asset(
                            'assets/patterns/6x3.svg',
                            color: Colors.white.withOpacity(0.3),
                            width: 80,
                            height: 35,
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          right: 0,
                          child: SvgPicture.asset(
                            'assets/patterns/pokeball.svg',
                            color: Colors.white.withOpacity(0.3),
                            width: 110,
                            height: 110,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: const Color.fromRGBO(242, 242, 242, 1),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/generations/generation3/252.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Image.asset(
                                    'assets/generations/generation3/255.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Image.asset(
                                    'assets/generations/generation3/258.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Text('Generation III'),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          left: 15,
                          child: SvgPicture.asset(
                            'assets/patterns/6x3.svg',
                            color: Colors.white.withOpacity(0.3),
                            width: 80,
                            height: 35,
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          right: 0,
                          child: SvgPicture.asset(
                            'assets/patterns/pokeball.svg',
                            color: Colors.white.withOpacity(0.3),
                            width: 110,
                            height: 110,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: const Color.fromRGBO(242, 242, 242, 1),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/generations/generation4/387.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Image.asset(
                                    'assets/generations/generation4/390.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Image.asset(
                                    'assets/generations/generation4/393.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Text('Generation IV'),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          left: 15,
                          child: SvgPicture.asset(
                            'assets/patterns/6x3.svg',
                            color: Colors.white.withOpacity(0.3),
                            width: 80,
                            height: 35,
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          right: 0,
                          child: SvgPicture.asset(
                            'assets/patterns/pokeball.svg',
                            color: Colors.white.withOpacity(0.3),
                            width: 110,
                            height: 110,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
