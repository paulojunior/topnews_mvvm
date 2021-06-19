import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newsArticleListViewModel.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';
import 'package:provider/provider.dart';
import 'newsArticleDetails.dart';
import 'widgets/newsList.dart';

class NewsListView extends StatefulWidget {
  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadLines();
  }

  _showNewsArticleDetails(BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsArticleDetailsView(article: article),
      ),
    );
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel viewModel) {
    switch (viewModel.loadingStatus) {
      case LoadingStatus.searching:
        return Align(
          child: CircularProgressIndicator(),
        );

      case LoadingStatus.empty:
        return Align(
          child: Text('No results found!'),
        );

      case LoadingStatus.completed:
        return Expanded(
          child: NewsList(
            articles: viewModel.articles,
            onSelected: (article) {
              _showNewsArticleDetails(context, article);
            },
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsArticleListViewModel>(context);
    final _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                viewModel.search(value);
              }
            },
            decoration: InputDecoration(
                labelText: "Enter search term",
                icon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => {_controller.clear()},
                )),
          ),
          _buildList(context, viewModel),
        ],
      ),
    );
  }
}
