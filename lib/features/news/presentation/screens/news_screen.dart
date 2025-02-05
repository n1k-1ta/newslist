import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newslist/features/news/data/repositories/news_repository.dart';
import '../bloc/news_bloc.dart';
import '../widgets/news_item.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: BlocProvider(
        create: (_) => NewsCubit(repository: NewsRepository())..fetchNews(),
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is NewsError) {
              return Center(child: Text(state.message));
            } else if (state is NewsLoaded) {
              final news = state.news;
              return ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return NewsItem(news: news[index]);
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
