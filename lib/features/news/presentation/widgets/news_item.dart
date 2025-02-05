import 'package:flutter/material.dart';
import 'package:newslist/features/news/data/models/news.dart';


class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    final formattedDate = "${news.date.day}-${news.date.month}-${news.date.year} ${news.date.hour}:${news.date.minute}";

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF1F1B1C), 
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          news.title,
          style: Theme.of(context).textTheme.titleLarge, 
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.description.length > 100
                  ? news.description.substring(0, 100) + '...'
                  : news.description,
              style: Theme.of(context).textTheme.bodyLarge, 
            ),
            SizedBox(height: 4),
            Text(
              'Date: $formattedDate',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 12), 
            ),
          ],
        ),
        trailing: news.isPopular || news.isHot
            ? Icon(Icons.flash_on, color: Colors.orange)
            : null,
        onTap: () {
        },
      ),
    );
  }
}