import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListController extends Notifier<List<String>> {
  final TextEditingController inputController = TextEditingController();

  @override
  List<String> build() {
    return ["Test", "item2"];
  }

  addItem(String item) {
    if (!state.any(
        (existingItem) => existingItem.toLowerCase() == item.toLowerCase())) {
      // using cascade and method of list
      state = [...state..add(item)];
    } else {}
  }

  updateItem(int index, String newValue) {
    if (!state.any((existingItem) =>
        existingItem.toLowerCase() == newValue.toLowerCase())) {
      // update
      state = [...state..[index] = newValue];
    } else {}
  }

  Future<void> deleteIndex(BuildContext context, int index) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      state = [...state..removeAt(index)];
    }
  }

  Future<void> delete(BuildContext context, String item) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      state = [...state..remove(item)];
    }
  }

  clear() {
    // clear
    state = [];
  }
}
