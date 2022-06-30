import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final logoImage = Image.asset('assets/images/Stranger-Things-Logo.png', width: 250, height: 200);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20), 
          child: logoImage,
        ),
      ],
    );
  }
}