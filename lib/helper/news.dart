import 'dart:convert';
import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

  Future<void> getNews () async {
    //URL by which we're going to fetch the data i.e. the GET URL
    /// Changing the country- change the us to in
    var url = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=0fd30b68efb34d13acda537f39b16c32";
    var response = await http.get(Uri.parse(url));
    //this jsonData is an basically object of keys and list as value for more visualization go through the link - https://newsapi.org/
    // The value List is also comprise of objects
    var jsonData = jsonDecode(response.body);
    //Either use this response.statusCode == 200 in if or the given condition
    if(jsonData['status'] == 'ok'){
        jsonData["articles"].forEach(
            //in here element is an object inside the list
            (element){
            //  Null value handling in here -  handle null values for all the variables you are fetching from the API
              if (element['urlToImage'] != null && element["description"] != null && element["title"] != null && element["author"] != null && element["url"] != null && element["content"] != null && element["publishedAt"] != null ){
              //  Now the List news is of the type ArticleModel so we need to first initialize the instance of that class, fill in the values
              //  and then append it in the list and reinitialize again to fill in new values.
                ArticleModel newsItems = ArticleModel(
                  author : element['author'],
                  title : element['title'],
                  description : element['description'],
                  url : element['url'],
                  urlToImage : element['urlToImage'],
                  content : element['content'],
                  publishedAt : DateTime.parse(element['publishedAt'])
                );
                news.add(newsItems);
              }

            }
        );
    }
  }
}


class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews (String category) async {
    //URL by which we're going to fetch the data i.e. the GET URL
    /// Changing the country- change the us to in
    var url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=0fd30b68efb34d13acda537f39b16c32";
    var response = await http.get(Uri.parse(url));
    //this jsonData is an basically object of keys and list as value for more visualization go through the link - https://newsapi.org/
    // The value List is also comprise of objects
    var jsonData = jsonDecode(response.body);
    //Either use this response.statusCode == 200 in if or the given condition
    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach(
        //in here element is an object inside the list
              (element){
            //  Null value handling in here -  handle null values for all the variables you are fetching from the API
            if (element['urlToImage'] != null && element["description"] != null && element["title"] != null && element["author"] != null && element["url"] != null && element["content"] != null && element["publishedAt"] != null ){
              //  Now the List news is of the type ArticleModel so we need to first initialize the instance of that class, fill in the values
              //  and then append it in the list and reinitialize again to fill in new values.
              ArticleModel newsItems = ArticleModel(
                  author : element['author'],
                  title : element['title'],
                  description : element['description'],
                  url : element['url'],
                  urlToImage : element['urlToImage'],
                  content : element['content'],
                  publishedAt : DateTime.parse(element['publishedAt'])
              );
              news.add(newsItems);
            }

          }
      );
    }
  }
}