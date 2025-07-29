import 'package:flutter/material.dart';

class FloorSelector extends StatefulWidget {
  final Function(int) onFloorSelected;

  const FloorSelector({
    super.key,
    required this.onFloorSelected,
  });

  @override
  _FloorselectorState createState() => _FloorselectorState();
}

class _FloorselectorState extends State<FloorSelector> {
  late Set<int> _selected;

  @override
  void initState() {
    super.initState();
    _selected = {1}; // Initialize with a default value, e.g., 1F selected
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<int>(
      segments: const [
        ButtonSegment(value: 1, label: Text('1F')),
        ButtonSegment(value: 2, label: Text('2F')),
        ButtonSegment(value: 3, label: Text('3F')),
        ButtonSegment(value: 4, label: Text('4F')),
        ButtonSegment(value: 5, label: Text('5F')),
      ],
      showSelectedIcon: false,
      selected: _selected,
      onSelectionChanged: (set) {
        setState(() {
          _selected = set;
          widget.onFloorSelected(_selected.first);
        });
      },
    );
  }
}
