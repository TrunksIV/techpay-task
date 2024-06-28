import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/blocs/movies_bloc/movies_bloc_bloc.dart';
import 'package:movies/constants/app_colors.dart';
import 'package:movies/constants/theme_constants.dart';
import 'package:movies/screens/home_screen/components/movie_card.dart';
import 'package:movies/screens/home_screen/components/movies_loading.dart';
import 'package:movies/utils/widget_utils.dart';

import '../../models/query-params/discover.dart';
import 'components/movie_genres/genres.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      searchController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildGrid(context, 4); // 4 columns for wide screens
            } else if (constraints.maxWidth > 400) {
              return _buildGrid(
                  context,
                  orientation == Orientation.landscape
                      ? 3
                      : 2); // 2 columns for medium screens
            } else {
              return _buildGrid(
                  context,
                  orientation == Orientation.landscape
                      ? 2
                      : 1); // 1 column for narrow screens
            }
          }),
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, int columnCount) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetUtils.verticalSpace(size: 12),
          const Text(
            "Welcome Back, Tariro",
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: ThemeConstants.h2,
              fontWeight: FontWeight.bold,
            ),
          ),
          WidgetUtils.verticalSpace(size: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.7,
                height: height * 0.07,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  searchMovies(context);
                },
                child: Container(
                  width: width * 0.16,
                  height: height * 0.07,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: BlocBuilder<MoviesBlocBloc, MoviesBlocState>(
                    builder: (context, state) {
                      if (state is MoviesBlocLoading) {
                        return const CircularProgressIndicator(
                          color: AppColors.white,
                        );
                      }
                      if (state is MoviesBlocSuccess && state.isSearch) {
                        return const Icon(
                          Icons.cancel_outlined,
                          size: 30,
                          color: Colors.white,
                        );
                      }
                      return const Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          WidgetUtils.verticalSpace(size: 24),
          const GenreList(),
          WidgetUtils.verticalSpace(size: 24),
          Expanded(
            child: BlocBuilder<MoviesBlocBloc, MoviesBlocState>(
              builder: (context, state) {
                if (state is MoviesBlocSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columnCount,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: state.moviePage.results!.length,
                    itemBuilder: (context, index) {
                      var result = state.moviePage.results?[index];
                      return MovieCard(
                          height: height, width: width, result: result);
                    },
                  );
                }

                if (state is MoviesBlocLoading) {
                  return const MoviesLoading();
                }

                return const Text("Error getting data");
              },
            ),
          ),
        ],
      ),
    );
  }

  searchMovies(BuildContext context) {
    var blocState = context.read<MoviesBlocBloc>().state;

    if (blocState is MoviesBlocSuccess && blocState.isSearch) {
      setState(() {
        searchController.text = '';
      });
      var params = DiscoverParams(
          genreName: "movie", page: 1, includeVideo: false, isAdult: true);

      BlocProvider.of<MoviesBlocBloc>(context).add(LoadMovies(params: params));
    } else if (searchController.text != '') {
      BlocProvider.of<MoviesBlocBloc>(context)
          .add(SearchMovies(query: searchController.text));
    } else {
      _dialogBuilder(context);
    }
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search Movies'),
          content: const Text(
            'Search cannot be empty',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
