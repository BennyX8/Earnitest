import 'package:flutter/material.dart';

class LoadingMoreView extends StatelessWidget {
  const LoadingMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.white,
      alignment: Alignment.center,
      child: const SizedBox(
        width: 60,
        height: 2,
        child: LinearProgressIndicator(),
      ),
    );
  }
}
