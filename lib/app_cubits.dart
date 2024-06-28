import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubits/movies_search_cubit/movies_search_cubit.dart';

class AppCubits extends StatelessWidget {
  const AppCubits({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MoviesSearchCubit())],
      child: child,
    );
  }
}
