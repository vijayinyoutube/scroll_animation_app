import 'package:flutter/material.dart';

import 'Widgets.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController = new ScrollController();
  bool backtoTop = false;
  bool isLastIndex = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        backtoTop = _scrollController.offset > 400 ? true : false;
        isLastIndex = _scrollController.offset >
                _scrollController.position.maxScrollExtent
            ? true
            : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollController Demo"),
      ),
      body: Container(
        child: Stack(
          children: [
            buildListView(_scrollController),
            buildBTT(_scrollController, backtoTop),
            buildText(isLastIndex),
          ],
        ),
      ),
    );
  }
}
