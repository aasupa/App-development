import 'package:flutter/material.dart';

import 'main_organo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    MainOrganoPage(),
    Container(child: Center(child: Text("Next_page"))),
    Container(child: Center(child: Text("Next_Next_page"))),
    Container(child: Center(child: Text("Next_Next_Next_page"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[2],
    );
  }
}
