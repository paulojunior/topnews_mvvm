import 'package:flutter/material.dart';

import '../../viewmodels/newsArticleViewModel.dart';
import '../newsArticleDetails.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;

  NewsList({required this.articles, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];

        return ListTile(
          leading: Container(
            width: 100,
            height: 100,
            child: article.imageURL.isEmpty
                ? Image.asset("images/news.jpeg")
                : Image.network(article.imageURL),
          ),
          title: Text(article.title),
          onTap: this.onSelected(article),
        );
      },
    );
  }
}
