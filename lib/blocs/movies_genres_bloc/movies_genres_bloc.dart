import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/models/movies/movie_genres.dart';
import 'package:movies/repositories/movies_repository.dart';

part 'movies_genres_event.dart';
part 'movies_genres_state.dart';

class MoviesGenresBloc extends Bloc<MoviesGenresEvent, MoviesGenresState> {
  final MoviesRepository repository;
  MoviesGenresBloc({required this.repository}) : super(MoviesGenresInitial()) {
    on<LoadGenres>((event, emit) async {
      try {
        emit(MoviesGenresLoading());
        MovieGenres data = await repository.getGenres();
        data.genres!.insert(0, Genres(id: null, name: 'All'));
        emit(MoviesGenresSuccess(data: data));
      } catch (e) {
        emit(MoviesGenresError());
      }
    });
  }
}
