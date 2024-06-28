import 'package:flutter/material.dart';
import 'package:movies/models/movies/movie.dart';
import 'package:movies/utils/widget_utils.dart';

class MovieDetails extends StatelessWidget {
  final Results? result;

  const MovieDetails({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result!.title ?? 'No Title'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie poster image
            FadeInImage(
              image: NetworkImage(
                  "http://image.tmdb.org/t/p/w500${result?.posterPath}"),
              placeholder: const AssetImage("assets/images/logo.png"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/logo.png',
                    fit: BoxFit.fitWidth);
              },
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 16.0),
            // Movie title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result!.title ?? 'No title',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  Row(
                    children: [
                      Text(
                        'Total Votes: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        '${result!.voteCount ?? 0}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  // Movie description
                  Row(
                    children: [
                      Text(
                        'Language: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        result!.originalLanguage ?? 'No data',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  WidgetUtils.verticalSpace(),
                  Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    result!.overview ?? 'No data',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
