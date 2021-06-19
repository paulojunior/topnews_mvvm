import 'package:news_app/models/newsArticle.dart';

import '../models/newsArticle.dart';

class NewsArticleViewModel {
  NewsArticle _newsArticle;

  NewsArticleViewModel({required NewsArticle article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title;
  }

  String get descrption {
    return _newsArticle.description;
  }

  String get imageURL {
    return _newsArticle.urlToImage;
  }

  String get url {
    return _newsArticle.url;
  }
}
