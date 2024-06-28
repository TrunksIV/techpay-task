import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/models/movies/movie.dart';
import 'package:movies/screens/movie_detail_screen/movie_details.dart';

import '../../../constants/app_colors.dart';
import '../../../utils/widget_utils.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {super.key,
      required this.result,
      required this.width,
      required this.height});

  final Results? result;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          WidgetUtils.route(MovieDetails(
            result: result,
          ))),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: FadeInImage(
          image: NetworkImage(
              "http://image.tmdb.org/t/p/w500${result?.posterPath}"),
          placeholder: const AssetImage("assets/images/logo.png"),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/images/logo.png', fit: BoxFit.fitWidth);
          },
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
