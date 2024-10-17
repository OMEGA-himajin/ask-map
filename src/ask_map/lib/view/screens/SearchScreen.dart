import 'package:flutter/material.dart';

import 'package:ask_map/view/widgets/CommonAppBar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.title});

  final String title;

  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
