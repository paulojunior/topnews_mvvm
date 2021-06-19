import 'package:flutter/material.dart';
import 'package:news_app/models/newsArticle.dart';

import '../services/webservice.dart';
import 'newsArticleViewModel.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.completed;

  List<NewsArticleViewModel> articles = [];

  Future<void> search(String keyword) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles =
        await WebServices().fetchHeadlinesByKeyword(keyword);

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  void populateTopHeadLines() async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticle = await WebServices().fetchTopHeadLines();
    this.articles = newsArticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
