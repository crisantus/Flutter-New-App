import 'dart:convert';
import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news=[];

  Future<void> getNews() async{
    String url="https://newsapi.org/v2/top-headlines?country=ng&apiKey=bc3617e70f6046d8b08d2e55bbb58bdd";

    http.Response response =await http.get(url);

    var jsonData=jsonDecode(response.body);

    //feedBack Response
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel=ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content']
          );

          news.add(articleModel);
        }
      });
    }
  }

}

class CategoryClassNews{
  List<ArticleModel> news=[];

  Future<void> getNews(String category) async{
    String url="http://newsapi.org/v2/top-headlines?category=$category&country=ng&apiKey=bc3617e70f6046d8b08d2e55bbb58bdd";

    var response =await http.get(url);

    var jsonData=jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel=ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']
          );

          news.add(articleModel);
        }
      });
    }
  }

}