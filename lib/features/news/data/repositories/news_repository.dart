import 'package:dio/dio.dart';
import '../models/news.dart';

class NewsRepository {
  final Dio dio = Dio();

  Future<List<News>> fetchNews() async {
    try {
      final response1 = await dio.get('https://exams2.masqed.ru/api1'); 
      final response2 = await dio.get('https://exams2.masqed.ru/api2'); 

      List<News> newsFromApi1 = (response1.data as List)
          .map((data) => News.fromApi1(data))
          .toList();
      List<News> newsFromApi2 = (response2.data['newsLine'] as List)
          .map((data) => News.fromApi2(data))
          .toList();

      List<News> allNews = [...newsFromApi1, ...newsFromApi2];

      allNews.sort((a, b) {
        if (a.isHot && !b.isHot) return -1;
        if (!a.isHot && b.isHot) return 1;
        return b.date.compareTo(a.date); 
      });

      return allNews;
    } catch (e) {
      rethrow;
    }
  }
}