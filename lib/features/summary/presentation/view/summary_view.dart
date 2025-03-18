import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


class SummaryView extends StatelessWidget {
  const SummaryView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  AppBar _appBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.upload_rounded),
          iconSize: 30,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.star_outline_rounded), iconSize: 30),
        IconButton(onPressed: () {}, icon: Icon(Icons.refresh_rounded), iconSize: 30),
        IconButton(onPressed: () {}, icon: Icon(Icons.copy_rounded), iconSize: 30),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.black12,
            ),
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "This title of video ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )),
          ListTile(
            title: Text("Text Direction"),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          MarkdownBody(data: "**hy**")
        ],
      ),
    );
  }
}
