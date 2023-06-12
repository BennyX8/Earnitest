import 'package:flutter/material.dart';

class EarniPayRoute extends PageRouteBuilder {
  final Widget child;
  final Object? arguements;
  final String? route;

  EarniPayRoute({
    required this.child,
    this.arguements,
    this.route,
  }) : super(
          settings: RouteSettings(name: route, arguments: arguements),
          pageBuilder: (context, anim1, anim2) => child,
          transitionsBuilder: (context, anim1, anim2, child) {
            return FadeTransition(
              opacity: anim1,
              child: Semantics(
                scopesRoute: true,
                explicitChildNodes: true,
                child: child,
              ),
            );
          },
        );
}
