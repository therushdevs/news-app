import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/category_news.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../helper/news.dart';
import '../models/article_model.dart';
import '../models/tab_bar_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List <CategoryModel> categories =<CategoryModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // The
    categories = getCategories();
    getArticles();
    initPlatformState();
  }

  Future <void> initPlatformState() async{

    OneSignal.shared.setAppId('5890f301-9211-4f41-ac84-fb164c055384');

  }

  List <ArticleModel> articles = <ArticleModel>[];
  var isLoaded = false;
  getArticles() async{
    News newsInstance = News();
    // We'll wait for the getNews() function to store its data in the news list created inside that class remember the future isn't
    //returning anything it is just processing the information and storing it inside the list.
    await newsInstance.getNews();
    //And now we will assign the news list to the articles list to get the data inside that list.
    articles = newsInstance.news;

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
          replacement: const Center(child: CircularProgressIndicator(),),
          // to handle the issue of overflow at the bottom
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                /// Categories
                Container(
                  // Padding given to bothe of them in the parent Container
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                    },
                  ),
                ),

                /// Blogs - Information fetched rom API
                /// copied this same container in the category_news
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
// The tiles in the upper horizontal layer are prepared from this.
//This class is used as a skeleton for writing the items in a widget
class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, this.imageUrl, required this.categoryName}) : super(key: key);
  final imageUrl;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        /// Routing to the WebView
        //Navigating to the ArticleView and adding in the link of the url to open it on the webpage
        //with the WEBVIEW
        Navigator.push(context, MaterialPageRoute(builder: (builder){
          return  CategoryNews(category: categoryName.toString().toLowerCase());
        }));
      },

        child: Container(
        margin: const EdgeInsets.only(right: 20, top: 6),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              //Image.network(imageUrl, width: 120, height: 60, fit: BoxFit.cover,),

              child: CachedNetworkImage(
                imageUrl:imageUrl, width: 120, height: 60, fit: BoxFit.cover,
              )
            ),
            Container(
              //Aligns the child of container to the center
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Text(categoryName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


//The skeleton for the main frame is created here i.e the vertical view behind the horizontal tags
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


