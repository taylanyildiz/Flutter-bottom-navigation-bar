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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [],
      ),
      bottomNavigationBar: CfNavigationBar(
        backgroundColor: Colors.red,
        barColor: Colors.orange,
        circleColor: Colors.grey,
        duration: Duration(seconds: 1),
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
