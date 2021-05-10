import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (page) => print(page),
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  '$index Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CfNavigationBar(
        controller: _controller!,
        onPressed: (index) => print(index),
        backgroundColor: Colors.red,
        barColor: Colors.orange,
        circleColor: Colors.orange,
        duration: Duration(milliseconds: 1000),
        curve: Curves.linear,
        items: [
          Icon(
            Icons.person,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.access_alarm,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.notification_important,
            size: 30.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
