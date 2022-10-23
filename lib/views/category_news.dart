import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/category_model.dart';
import '../models/article_model.dart';
import '../models/tab_bar_widget.dart';
import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  const CategoryNews({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryArticles();
  }
  List <ArticleModel> articles = <ArticleModel>[];
  var isLoaded = false;

  getCategoryArticles() async{
    CategoryNewsClass categoryNewsInstance =  CategoryNewsClass();
    await categoryNewsInstance.getNews(widget.category);
    articles = categoryNewsInstance.news;
    setState(() {
      isLoaded = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('MyNews',
              style: TextStyle(
                color: Colors.black,
              ),),
            Text('App',
              style: TextStyle(
                color: Colors.blue,
              ),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(

                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BlogTile(
                          urlToImage: articles[index].urlToImage,
                          title: articles[index].title,
                          description: articles[index].description,
                          url: articles[index].url,
                        );
                      },
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
      bottomNavigationBar: const TabBarWidget(),
    );
  }
}

class BlogTile extends StatelessWidget {
  const BlogTile({Key? key, required this.urlToImage, required this.title, required this.description, required this.url}) : super(key: key);
  final String urlToImage, title, description, url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        /// Routing to the WebView
        //Navigating to the ArticleView and adding in the link of the url to open it on the webpage
        //with the WEBVIEW
        Navigator.push(context, MaterialPageRoute(builder: (builder){
          return  ArticleView(
            /// the provided url is to the news link
            blogView: url,
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [

            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(urlToImage)
            ),
            const SizedBox(height: 8,),
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,

              ),
            ),
            const SizedBox(height: 4,),
            Text(description,
              style: const TextStyle(
                color: Colors.black54,
              ),),
          ],
        ),
      ),
    );
  }
}
