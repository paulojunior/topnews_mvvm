import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

import 'views/newsListView.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fresh News",
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: NewsListView(),
      ),
    );
  }
}
