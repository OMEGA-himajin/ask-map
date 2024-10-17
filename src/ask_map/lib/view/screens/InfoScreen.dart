import 'package:flutter/material.dart';

class Infoscreen extends StatelessWidget {
  const Infoscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('愛知総合工科マップ'),
            subtitle: Text('ASK-MAP'),
          ),
          ListTile(
            title: Text('ライセンス/LISENSE'),
          ),
          ListTile(
            title: Text('フィードバック/Feedback'),
          ),
        ],
      ),
    );
  }
}
