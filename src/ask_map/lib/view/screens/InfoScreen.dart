import 'package:flutter/material.dart';
import 'package:ask_map/view/widgets/CommonAppBar.dart';

class InfoScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'title': 'ASK-MAP', 'subtitle': 'ver'},
    {'title': 'LICENSE', 'subtitle': ''},
    {'title': 'FeedBack', 'subtitle': ''}
  ];
  InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.appBar(),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Container',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              title: Text("ASK-MAP"),
              subtitle: Text("ver"),
              onTap: () {
                // _handleTap(context, 0);
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              title: Text("ASK-MAP"),
              subtitle: Text("ver"),
              onTap: () {
                // _handleTap(context, 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
