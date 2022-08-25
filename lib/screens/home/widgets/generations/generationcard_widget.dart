import 'package:app_pokedex/bloc/pokedex_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class GenerationsCards extends StatefulWidget {
  const GenerationsCards({
    Key? key,
    required this.generation,
  }) : super(key: key);

  final Generation generation;

  @override
  State<GenerationsCards> createState() => _GenerationsCardsState();
}

class _GenerationsCardsState extends State<GenerationsCards> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PokedexBloc>();

    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: SizedBox(
        height: 400,
        child: GridView.count(
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () {
                cubit.setGeneration(Generation.generationI);
                Navigator.of(context).pop();
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: widget.generation == Generation.generationI
                    ? const Color.fromRGBO(234, 93, 96, 1)
                    : const Color.fromRGBO(242, 242, 242, 1),
                child: Stack(
                  children: [
                    generationsPatterns(
                        widget.generation == Generation.generationI
                            ? true
                            : false),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            'Generation I',
                            style: TextStyle(
                              color: widget.generation == Generation.generationI
                                  ? Colors.white
                                  : const Color.fromRGBO(16, 116, 118, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                cubit.setGeneration(Generation.generationII);
                Navigator.of(context).pop();
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: widget.generation == Generation.generationII
                    ? const Color.fromRGBO(234, 93, 96, 1)
                    : const Color.fromRGBO(242, 242, 242, 1),
                child: Stack(
                  children: [
                    generationsPatterns(
                        widget.generation == Generation.generationII
                            ? true
                            : false),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            'Generation II',
                            style: TextStyle(
                              color:
                                  widget.generation == Generation.generationII
                                      ? Colors.white
                                      : const Color.fromRGBO(16, 116, 118, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                cubit.setGeneration(Generation.generationIII);
                Navigator.of(context).pop();
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: widget.generation == Generation.generationIII
                    ? const Color.fromRGBO(234, 93, 96, 1)
                    : const Color.fromRGBO(242, 242, 242, 1),
                child: Stack(
                  children: [
                    generationsPatterns(
                        widget.generation == Generation.generationIII
                            ? true
                            : false),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            'Generation III',
                            style: TextStyle(
                              color:
                                  widget.generation == Generation.generationIII
                                      ? Colors.white
                                      : const Color.fromRGBO(16, 116, 118, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: widget.generation == Generation.generationIV
                  ? const Color.fromRGBO(234, 93, 96, 1)
                  : const Color.fromRGBO(242, 242, 242, 1),
              child: Stack(
                children: [
                  generationsPatterns(
                      widget.generation == Generation.generationIV
                          ? true
                          : false),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Generation IV',
                          style: TextStyle(
                            color: widget.generation == Generation.generationIV
                                ? Colors.white
                                : const Color.fromRGBO(16, 116, 118, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: widget.generation == Generation.generationV
                  ? const Color.fromRGBO(234, 93, 96, 1)
                  : const Color.fromRGBO(242, 242, 242, 1),
              child: Stack(
                children: [
                  generationsPatterns(
                      widget.generation == Generation.generationV
                          ? true
                          : false),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/generations/generation5/495.png',
                              width: 40,
                              height: 40,
                            ),
                            Image.asset(
                              'assets/generations/generation5/498.png',
                              width: 40,
                              height: 40,
                            ),
                            Image.asset(
                              'assets/generations/generation5/501.png',
                              width: 40,
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Generation V',
                          style: TextStyle(
                            color: widget.generation == Generation.generationV
                                ? Colors.white
                                : const Color.fromRGBO(16, 116, 118, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: widget.generation == Generation.generationVI
                  ? const Color.fromRGBO(234, 93, 96, 1)
                  : const Color.fromRGBO(242, 242, 242, 1),
              child: Stack(
                children: [
                  generationsPatterns(
                      widget.generation == Generation.generationVI
                          ? true
                          : false),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/generations/generation6/650.png',
                              width: 40,
                              height: 40,
                            ),
                            Image.asset(
                              'assets/generations/generation6/653.png',
                              width: 40,
                              height: 40,
                            ),
                            Image.asset(
                              'assets/generations/generation6/656.png',
                              width: 40,
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Generation VI',
                          style: TextStyle(
                            color: widget.generation == Generation.generationVI
                                ? Colors.white
                                : const Color.fromRGBO(16, 116, 118, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: widget.generation == Generation.generationVII
                  ? const Color.fromRGBO(234, 93, 96, 1)
                  : const Color.fromRGBO(242, 242, 242, 1),
              child: Stack(
                children: [
                  generationsPatterns(
                      widget.generation == Generation.generationVII
                          ? true
                          : false),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/generations/generation7/722.png',
                              width: 40,
                              height: 40,
                            ),
                            Image.asset(
                              'assets/generations/generation7/725.png',
                              width: 40,
                              height: 40,
                            ),
                            Image.asset(
                              'assets/generations/generation7/728.png',
                              width: 40,
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Generation VII',
                          style: TextStyle(
                            color: widget.generation == Generation.generationVII
                                ? Colors.white
                                : const Color.fromRGBO(16, 116, 118, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: widget.generation == Generation.generationVIII
                  ? const Color.fromRGBO(234, 93, 96, 1)
                  : const Color.fromRGBO(242, 242, 242, 1),
              child: Stack(
                children: [
                  generationsPatterns(
                      widget.generation == Generation.generationVIII
                          ? true
                          : false),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/generations/generation8/810.png',
                              width: 40,
                              height: 40,
                            ),
                            Image.asset(
                              'assets/generations/generation8/813.png',
                              width: 40,
                              height: 40,
                            ),
                            Image.asset(
                              'assets/generations/generation8/816.png',
                              width: 40,
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Generation VIII',
                          style: TextStyle(
                            color:
                                widget.generation == Generation.generationVIII
                                    ? Colors.white
                                    : const Color.fromRGBO(16, 116, 118, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget generationsPatterns(bool isActive) {
  return ListView(
    children: [
      SvgPicture.asset(
        'assets/patterns/6x3.svg',
        color: Colors.white.withOpacity(0.3),
        width: 80,
        height: 35,
      ),
      SvgPicture.asset(
        'assets/patterns/pokeball.svg',
        color: isActive
            ? Color.alphaBlend(
                const Color.fromRGBO(245, 245, 245, 0.4),
                const Color.fromRGBO(236, 236, 236, 0.1),
              )
            : Color.alphaBlend(
                const Color.fromRGBO(245, 245, 245, 1),
                const Color.fromRGBO(236, 236, 236, 0.6),
              ),
        width: 145,
        height: 145,
      ),
    ],
  );
}

isActiveCard(generation) {
  switch (generation) {
    case Generation.generationI:
      const Color.fromRGBO(234, 93, 96, 1);
      break;
    case Generation.generationII:
      const Color.fromRGBO(234, 93, 96, 1);
      break;
    case Generation.generationIII:
      const Color.fromRGBO(234, 93, 96, 1);
      break;
    case Generation.generationIV:
      const Color.fromRGBO(234, 93, 96, 1);
      break;
    case Generation.generationV:
      const Color.fromRGBO(234, 93, 96, 1);
      break;
    case Generation.generationVI:
      const Color.fromRGBO(234, 93, 96, 1);
      break;
    case Generation.generationVII:
      const Color.fromRGBO(234, 93, 96, 1);
      break;
    case Generation.generationVIII:
      const Color.fromRGBO(234, 93, 96, 1);
      break;
    default:
      const Color.fromRGBO(242, 242, 242, 1);
  }
}
