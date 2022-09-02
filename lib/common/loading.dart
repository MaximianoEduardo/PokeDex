import 'package:flutter/material.dart';

class LoadingCustom extends StatelessWidget {
  const LoadingCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 45,
        width: 45,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
