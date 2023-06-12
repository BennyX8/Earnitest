import 'package:earnitest/core/helpers/helpers.dart';
import 'package:earnitest/features/gallery/app/pages/gallery_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const route = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3), () {
        pp('Splash');
        Navigator.pushReplacementNamed(context, GalleryPage.route);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 100,
              child: Image.asset('assets/images/leaf.png'),
            ),

            //* Vertical Spacer
            const SizedBox(height: 20),

            const SizedBox(
              width: 40.0,
              height: 1,
              child: LinearProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
