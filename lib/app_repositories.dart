import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/repositories/movies_provider.dart';
import 'package:movies/repositories/movies_repository.dart';

class AppRepositories extends StatelessWidget {
  const AppRepositories({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => MoviesRepository(provider: MoviesProvider()),
        ),
      ],
      child: child,
    );
  }
}
