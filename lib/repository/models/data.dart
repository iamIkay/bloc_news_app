import 'news_category.dart';

Future<List<NewsCategory>> getCategories(){

  List<NewsCategory> myCategories = [];
  NewsCategory newsCategory;

  //1
  newsCategory =  NewsCategory();
  newsCategory.name = "General";
  newsCategory.image = "https://media.istockphoto.com/photos/old-newspapers-on-wooden-table-picture-id846448536?b=1&k=20&m=846448536&s=170667a&w=0&h=J85TKx2ad3vSpV7gfhTkTvxo93xpYymFnytndDoOwkw=";
  myCategories.add(newsCategory);
  

  //2
  newsCategory =  NewsCategory();
  newsCategory.name = "Entertainment";
  newsCategory.image = "https://cdn.vox-cdn.com/thumbor/qAOExpJwBQrvWqssMEY2JlNFZN4=/0x0:3000x2000/1200x800/filters:focal(1021x1075:1501x1555)/cdn.vox-cdn.com/uploads/chorus_image/image/70310267/RoundUpArt_LEDESTREAM.0.jpg";
  myCategories.add(newsCategory);

  //3
  newsCategory =  NewsCategory();
  newsCategory.name = "Business";
  newsCategory.image = "https://ied.eu/wp-content/uploads/2018/10/ERP-Business-Intelligence-Wallpaper.png";
  myCategories.add(newsCategory);

  //4
  newsCategory =  NewsCategory();
  newsCategory.name = "Health";
  newsCategory.image = "https://www.expatica.com/app/uploads/2020/11/Health-Insurance-Quotes-1920x1080.jpg";
  myCategories.add(newsCategory);

  //5
  newsCategory =  NewsCategory();
  newsCategory.name = "Science";
  newsCategory.image = "https://epe.brightspotcdn.com/dims4/default/ca24d5b/2147483647/strip/true/crop/589x400+5+0/resize/840x570!/quality/90/?url=https%3A%2F%2Fepe-brightspot.s3.amazonaws.com%2F6e%2Ff5%2F8b38bc98bf3b0ce6dd17c71c24b3%2F07zucker-img.jpg";
  myCategories.add(newsCategory);

  //5
  newsCategory =  NewsCategory();
  newsCategory.name = "Sports";
  newsCategory.image = "https://www.wrl.org/wp-content/uploads/2021/12/various-sports-accessories-pic.jpg";
  myCategories.add(newsCategory);

  //5
  newsCategory =  NewsCategory();
  newsCategory.name = "Technology";
  newsCategory.image = "https://images.squarespace-cdn.com/content/v1/5c90fe2eaf468307c83acde2/1582809468618-5SMX6M2YIOUZJVAN4IZ5/How+Digital+Technology+Has+Changed+Photography";
  myCategories.add(newsCategory);

  return Future.value(myCategories);

}