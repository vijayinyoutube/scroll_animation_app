import 'package:flutter/material.dart';

Widget buildListView(ScrollController _scrollController) => ListView.builder(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      itemCount: 50,
      itemBuilder: (context, index) {
        return Container(
          width: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.5),
                color: Colors.green[100],
              ),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Index $index"),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

Widget buildBTT(ScrollController _scrollController, bool backtoTop) => backtoTop
    ? Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              _scrollController.animateTo(0,
                  duration: Duration(seconds: 1), curve: Curves.linear);
            },
            label: Text("Back to Top"),
          ),
        ),
      )
    : SizedBox();

Widget buildText(bool isLastIndex) => isLastIndex
    ? Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          "All caught up 🎉",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.00),
        ),
      )
    : SizedBox();
