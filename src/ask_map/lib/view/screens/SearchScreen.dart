// import 'package:flutter/material.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key, required this.title});

//   final String title;

//   @override
//   _SearchScreen createState() => _SearchScreen();
// }

// class _SearchScreen extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _SearchBarAppState extends State<SearchBarApp> {
//   bool isDark = false;

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = ThemeData(
//         useMaterial3: true,
//         brightness: isDark ? Brightness.dark : Brightness.light);

//     return MaterialApp(
//       theme: themeData,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Search Bar Sample')),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SearchAnchor(
//               builder: (BuildContext context, SearchController controller) {
//             return SearchBar(
//               controller: controller,
//               padding: const MaterialStatePropertyAll<EdgeInsets>(
//                   EdgeInsets.symmetric(horizontal: 16.0)),
//               onTap: () {
//                 controller.openView();
//               },
//               onChanged: (_) {
//                 controller.openView();
//               },
//               leading: const Icon(Icons.search),
//               trailing: <Widget>[
//                 Tooltip(
//                   message: 'Change brightness mode',
//                   child: IconButton(
//                     isSelected: isDark,
//                     onPressed: () {
//                       setState(() {
//                         isDark = !isDark;
//                       });
//                     },
//                     icon: const Icon(Icons.wb_sunny_outlined),
//                     selectedIcon: const Icon(Icons.brightness_2_outlined),
//                   ),
//                 )
//               ],
//             );
//           }, suggestionsBuilder:
//                   (BuildContext context, SearchController controller) {
//             return List<ListTile>.generate(5, (int index) {
//               final String item = 'item $index';
//               return ListTile(
//                 title: Text(item),
//                 onTap: () {
//                   setState(() {
//                     controller.closeView(item);
//                   });
//                 },
//               );
//             });
//           }),
//         ),
//       ),
//     );
//   }
// }
