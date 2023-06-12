import 'package:earnitest/core/dependencies/earni_route.dart';
import 'package:earnitest/core/widgets/splash_page.dart';
import 'package:earnitest/core/widgets/unknown_route.dart';
import 'package:earnitest/features/gallery/app/pages/gallery_page.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Dependency Injector
  await di.init();

  //Init Fast Cache Image
  await FastCachedImageConfig.init(
    clearCacheAfter: const Duration(days: 15),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: navKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(color: Colors.black54),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: false,
          elevation: 0.0,
        ),
      ),
      initialRoute: SplashPage.route,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case GalleryPage.route:
            return EarniPayRoute(
              child: const GalleryPage(),
              arguements: settings.arguments,
              route: settings.name,
            );
          case SplashPage.route:
            return EarniPayRoute(
              child: const SplashPage(),
              arguements: settings.arguments,
              route: settings.name,
            );

          default:
            return EarniPayRoute(child: const UnknownPage());
        }
      },
    );
  }
}
