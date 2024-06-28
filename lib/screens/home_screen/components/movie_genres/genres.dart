import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/blocs/movies_bloc/movies_bloc_bloc.dart';
import 'package:movies/blocs/movies_genres_bloc/movies_genres_bloc.dart';
import 'package:movies/constants/app_colors.dart';
import 'package:movies/models/movies/movie_genres.dart';
import 'package:movies/screens/home_screen/components/movie_genres/genre_item.dart';

import '../../../../models/query-params/discover.dart';

class GenreList extends StatefulWidget {
  const GenreList({super.key});

  @override
  State<GenreList> createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  Genres _genreItem = Genres(id: null, name: 'All');
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<MoviesGenresBloc, MoviesGenresState>(
        builder: (context, state) {
          if (state is MoviesGenresLoading) {
            return const SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }

          if (state is MoviesGenresSuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getGenres(height, state.data.genres!),
            );
          }

          return const Text("No Genres Found");
        },
      ),
    );
  }

  List<Widget> getGenres(double height, List<Genres> genres) {
    List<Widget> items = [];
    var params;
    genres.forEach((item) {
      items.add(InkWell(
        onTap: () => {
          setState(() {
            _genreItem = item;
          }),
          if (item.id == null)
            {
              params = DiscoverParams(
                  genreName: "movie",
                  page: 1,
                  includeVideo: false,
                  isAdult: true),
            }
          else
            {
              params = DiscoverParams(
                  genreName: "movie",
                  page: 1,
                  includeVideo: false,
                  isAdult: true,
                  genreId: item.id),
            },
          BlocProvider.of<MoviesBlocBloc>(context)
              .add(LoadMovies(params: params))
        },
        child: GenreItem(
            height: height,
            title: item.name ?? 'No Data',
            isActive: item == _genreItem),
      ));
    });

    return items;
  }
}
