import 'package:flutter/material.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({
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
      onPressed: () {},
    );
  }
}
