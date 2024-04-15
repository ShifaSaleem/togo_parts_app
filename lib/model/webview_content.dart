class WebviewContent {
  late String title, url;
  WebviewContent({required this.title, required this.url});
}
class WebviewContentDetail {
  static List<WebviewContent> content = [
    WebviewContent(
        title: 'Home',
        url: 'https://www.togoparts.com/home'
    ),
    WebviewContent(
        title: 'Rides',
        url: 'https://www.togoparts.com/bikeprofile/trides'
    ),
    WebviewContent(
        title: 'Marketplace',
        url: 'https://www.togoparts.com/marketplace/browse'
    ),
    WebviewContent(
        title: 'Magazine',
        url: 'https://www.togoparts.com/magazine/'
    ),

  ];

}