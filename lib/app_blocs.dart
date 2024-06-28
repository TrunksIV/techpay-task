import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/blocs/movies_bloc/movies_bloc_bloc.dart';
import 'package:movies/repositories/movies_repository.dart';

import 'blocs/movies_genres_bloc/movies_genres_bloc.dart';

class AppBlocs extends StatelessWidget {
  const AppBlocs({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesBlocBloc(
            repository: RepositoryProvider.of<MoviesRepository>(context),
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => MoviesGenresBloc(
            repository: RepositoryProvider.of<MoviesRepository>(context),
          ),
          lazy: false,
        ),
      ],
      child: child,
    );
  }
}
