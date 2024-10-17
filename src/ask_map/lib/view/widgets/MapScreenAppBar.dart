import 'package:flutter/material.dart';
import 'package:ask_map/view/screens/SearchScreen.dart';

class MapScreenAppBar {
  static appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Column(
        children: [
          SearchButton(),
        ],
      ),
      actions: const [
        InfoButton(),
      ],
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, '/info');
      },
      icon: const Icon(Icons.info_outline),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.search),
      label: const Text('検索'),
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          foregroundColor: Colors.grey,
          fixedSize: const Size.fromWidth(double.maxFinite)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchScreen(title: 'Search')));
      },
    );
  }
}
