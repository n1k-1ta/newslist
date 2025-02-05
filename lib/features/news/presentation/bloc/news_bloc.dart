import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newslist/features/news/data/models/news.dart';
import '../../data/repositories/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository repository;

  NewsCubit({required this.repository}) : super(NewsInitial());

  Future<void> fetchNews() async {
    try {
      emit(NewsLoading());
      final news = await repository.fetchNews();
      emit(NewsLoaded(news: news));
    } catch (e) {
      emit(NewsError(message: 'Failed to load news.'));
    }
  }
}
