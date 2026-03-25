// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:multiple_search_selection/multiple_search_selection.dart';

class MultiSelectSearch extends StatefulWidget {
  const MultiSelectSearch({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<MultiSelectSearch> createState() => _MultiSelectSearchState();
}

class _MultiSelectSearchState extends State<MultiSelectSearch> {
  final List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Mango',
    'Orange',
    'Grape',
    'Pineapple',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 500,
      child: MultipleSearchSelection<String>(
        items: items,

        /// Required
        fieldToCheck: (item) => item, // ใช้ item ตรง ๆ (เพราะเป็น String)
        searchField: TextField(
          decoration: const InputDecoration(
            hintText: 'Search fruits...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
        itemBuilder: (item, index, isSelected) => ListTile(
          title: Text(item),
          tileColor: isSelected
              ? Colors.blueAccent.withOpacity(0.1)
              : Colors.transparent,
        ),

        /// Optional
        pickedItemBuilder: (item) => Chip(
          label: Text(item),
          backgroundColor: Colors.blueAccent.withOpacity(0.2),
        ),
        onPickedChange: (selected) {
          debugPrint('Selected items: $selected');
        },
        selectAllButton: const Text('Select All'),
        clearAllButton: const Text('Clear All'),
      ),
    );
  }
}
