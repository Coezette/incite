class ArticleModel {
  String author;
  String title;
  String description;
  String content;
  String urlToImage;
  String url;
  DateTime publishedAt;

  ArticleModel(
      {this.author,
      this.title,
      this.description,
      this.content, //actually NewsAPI free plan content is just the same as the description
      this.urlToImage,
      this.url,
      this.publishedAt});

  factory ArticleModel.fromJson(Map<String, dynamic> item) {
    return ArticleModel(
      author: item["author"],
      title: item["title"],
      description: item["description"],
      content: item["content"],
      urlToImage: item["urlToImage"],
      url: item["url"],
      publishedAt: DateTime.parse(item["publishedAt"]),
    );
  }
}
