import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokedex_bloc.dart';

class ModalBottomSort extends StatefulWidget {
  const ModalBottomSort({
    Key? key,
    required this.sort,
    required this.generation,
  }) : super(key: key);

  final SortPokemons sort;
  final Generation generation;

  @override
  State<ModalBottomSort> createState() => _ModalBottomSortState();
}

class _ModalBottomSortState extends State<ModalBottomSort> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PokedexBloc>();

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 40,
      ),
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            children: [
              Text(
                'Sort',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                'Sort Pokémons alphabetically or by National Pokédex number!',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 300,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0, bottom: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    cubit.setSort(
                      SortPokemons.smallestID,
                      widget.generation,
                    );
                  },
                  child: Card(
                    color: widget.sort == SortPokemons.smallestID
                        ? const Color.fromRGBO(234, 93, 96, 1)
                        : const Color.fromRGBO(242, 242, 242, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text('Smallest number first',
                            style: TextStyle(
                              color: widget.sort == SortPokemons.smallestID
                                  ? Colors.white
                                  : const Color.fromRGBO(116, 116, 118, 1),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    cubit.setSort(
                      SortPokemons.highestID,
                      widget.generation,
                    );
                  },
                  child: Card(
                    color: widget.sort == SortPokemons.highestID
                        ? const Color.fromRGBO(234, 93, 96, 1)
                        : const Color.fromRGBO(242, 242, 242, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text('Highest number first',
                            style: TextStyle(
                              color: widget.sort == SortPokemons.highestID
                                  ? Colors.white
                                  : const Color.fromRGBO(116, 116, 118, 1),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    cubit.setSort(
                      SortPokemons.atoz,
                      widget.generation,
                    );
                  },
                  child: Card(
                    color: widget.sort == SortPokemons.atoz
                        ? const Color.fromRGBO(234, 93, 96, 1)
                        : const Color.fromRGBO(242, 242, 242, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text('A-Z',
                            style: TextStyle(
                              color: widget.sort == SortPokemons.atoz
                                  ? Colors.white
                                  : const Color.fromRGBO(116, 116, 118, 1),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    cubit.setSort(
                      SortPokemons.ztoa,
                      widget.generation,
                    );
                  },
                  child: Card(
                    color: widget.sort == SortPokemons.ztoa
                        ? const Color.fromRGBO(234, 93, 96, 1)
                        : const Color.fromRGBO(242, 242, 242, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text('Z-A',
                            style: TextStyle(
                              color: widget.sort == SortPokemons.ztoa
                                  ? Colors.white
                                  : const Color.fromRGBO(116, 116, 118, 1),
                            )),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
