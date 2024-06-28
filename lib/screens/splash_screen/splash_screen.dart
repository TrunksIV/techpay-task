import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/blocs/movies_genres_bloc/movies_genres_bloc.dart';
import 'package:movies/utils/widget_utils.dart';

import '../../blocs/movies_bloc/movies_bloc_bloc.dart';
import '../../models/query-params/discover.dart';
import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    animateLogo();
    initializeData();
  }

// Pulsating Animation for logo
  void animateLogo() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).push(WidgetUtils.route(const HomeScreen()));
    });
  }

  // On start get movies

  void initializeData() {
    // Get Movies
    DiscoverParams params = DiscoverParams(
        genreName: "movie", page: 1, includeVideo: false, isAdult: true);
    BlocProvider.of<MoviesBlocBloc>(context).add(LoadMovies(params: params));

    // Get Movie Genres
    BlocProvider.of<MoviesGenresBloc>(context).add(LoadGenres());
  }

  // disposing every sibscriptions

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: ScaleTransition(
              scale: _animation,
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
