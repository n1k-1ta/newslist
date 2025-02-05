class News {
  final String title;
  final String description;
  final String author;
  final bool isPopular;
  final bool isHot;
  final DateTime date;
  final String source;

  News({
    required this.title,
    required this.description,
    required this.author,
    required this.isPopular,
    required this.isHot,
    required this.date,
    required this.source,
  });

  factory News.fromApi1(Map<String, dynamic> data) {
    return News(
      title: data['title'],
      description: data['description'],
      author: data['author'],
      isPopular: data['hot'] ?? false,
      isHot: data['hot'] ?? false,
      date: DateTime.fromMillisecondsSinceEpoch(data['date']),
      source: data['site'],
    );
  }

  factory News.fromApi2(Map<String, dynamic> data) {
    return News(
      title: data['main'],
      description: data['article'],
      author: data['author'],
      isPopular: data['isPopular'] ?? false,
      isHot: data['isPopular'] ?? false,
      date: DateTime.parse(data['datetime']),
      source: data['source'],
    );
  }
}