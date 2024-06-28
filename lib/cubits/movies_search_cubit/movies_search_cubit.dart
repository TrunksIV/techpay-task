import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movies_search_state.dart';

class MoviesSearchCubit extends Cubit<MoviesSearchState> {
  MoviesSearchCubit() : super(MoviesSearchInitial());
}
