import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incite/keys.dart';

import '../models/article_model.dart';

//Global or Trending News
class TrendingNews {
  static List<ArticleModel> articles = new List<ArticleModel>();

  static String url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$NEWS_API_KEY&pageSize=100";

  static Future<void> getNews() async {
    var response = await http.get(url); //just gets the response as a string
    var jsonData = jsonDecode(
        response.body); //this then turns that string into json objects(Maps)

    if (jsonData['status'] == "ok") {
      for (var item in jsonData["articles"]) {
        if (item["urlToImage"] != null && item["description"] != null) {
          articles.add(ArticleModel.fromJson(item));
        }
      }
    }
  }
}

class TrendingCategoryNews {
  List<ArticleModel> articles = new List<ArticleModel>();

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=$NEWS_API_KEY&pageSize=100";

    var response = await http.get(url); //just gets the response as a string
    var jsonData = jsonDecode(
        response.body); //this then turns that string into json objects(Maps)

    if (jsonData['status'] == "ok") {
      for (var item in jsonData["articles"]) {
        if (item["urlToImage"] != null && item["description"] != null) {
          articles.add(ArticleModel.fromJson(item));
        }
      }
    }
  }
}

//Local News
class LocalNews {
  List<ArticleModel> articles = new List<ArticleModel>();

  Future<void> getNews(String location) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=$location&apiKey=$NEWS_API_KEY&pageSize=100";

    var response = await http.get(url); //just gets the response as a string
    var jsonData = jsonDecode(
        response.body); //this then turns that string into json objects(Maps)

    if (jsonData['status'] == "ok") {
      for (var item in jsonData["articles"]) {
        if (item["urlToImage"] != null && item["description"] != null) {
          articles.add(ArticleModel.fromJson(item));
        }
      }
    }
  }
}

class LocalNewsByCategory {
  List<ArticleModel> articles = new List<ArticleModel>();

  Future<void> getNews(String location, String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=$location&category=$category&apiKey=$NEWS_API_KEY&pageSize=100";

    var response = await http.get(url); //just gets the response as a string
    var jsonData = jsonDecode(
        response.body); //this then turns that string into json objects(Maps)

    if (jsonData['status'] == "ok") {
      for (var item in jsonData["articles"]) {
        if (item["urlToImage"] != null && item["description"] != null) {
          articles.add(ArticleModel.fromJson(item));
        }
      }
    }
  }
}
