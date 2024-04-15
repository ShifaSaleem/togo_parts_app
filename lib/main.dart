import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'model/webview_content.dart';

void main() {
  runApp(TogoParts());
}

class TogoParts extends StatelessWidget {
  TogoParts({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Togo Parts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  int currentIndex = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (a) {},
        ),
      );
    controller.loadRequest(
        Uri.parse(WebviewContentDetail.content[widget.currentIndex].url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(WebviewContentDetail.content[widget.currentIndex].title),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 4,
          currentIndex: widget.currentIndex,
          onTap: (index) {
            setState(() {
              widget.currentIndex = index;
              controller.loadRequest(Uri.parse(
                  WebviewContentDetail.content[widget.currentIndex].url));
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bike_scooter), label: 'Rides'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Marketplace'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books), label: 'Magazines'),
          ],
        ),
        body: Material(
            child: WebViewWidget(
                controller:
                controller)) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
