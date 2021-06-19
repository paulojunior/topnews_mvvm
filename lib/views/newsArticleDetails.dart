import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsView extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsArticleDetailsView({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$this.article.title"),
      ),
      body: WebView(
        initialUrl: this.article.url,
      ),
    );
  }
}
