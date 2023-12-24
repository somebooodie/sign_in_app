import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_in/singed_in.dart';
import 'package:sign_in/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => HomeScreen(),
      ),
      GoRoute(
        path: '/signed_in/:username',
        builder: (BuildContext context, GoRouterState state) {
        
          final username = state.pathParameters['username'] ?? '';
          return SignedInPage(username: username);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      debugShowCheckedModeBanner: false,
      title: 'Sign In App',
    );
  }
}
