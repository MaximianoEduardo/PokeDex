import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardSkeleton extends StatelessWidget {
  const CardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 5),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Card(
        shadowColor: const Color.fromRGBO(139, 190, 138, 0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            //color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            width: 352,
            height: 133,
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(),
              ),
              Row()
            ]),
          ),
        ),
      ),
    );
  }
}
