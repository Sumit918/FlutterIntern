import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_profile_app/features/crypto_app/domain/formmodel.dart';
import 'package:my_profile_app/features/crypto_app/presentation/state/formstate.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key, this.item});
  final FormModel? item;

  @override
  State<MyForm> createState() => _ListItemFormNewState();
}

class _ListItemFormNewState extends State<MyForm> {
  late final TextEditingController titleController =
      TextEditingController(text: widget.item?.title);
  late final TextEditingController descController =
      TextEditingController(text: widget.item?.description);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final isEditing = widget.item != null;

  late FormModel currentItem = widget.item ?? const FormModel();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final listController = ref.read(formProvider.notifier);
      return Scaffold(
        appBar: AppBar(
          title: Text(isEditing ? "Edit Item" : "Add Item"),
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEditing ? "Edit your item" : "Create a new item",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) {
                      currentItem = currentItem.copyWith(title: value, dateTime: DateTime.now());
                    },
                    controller: titleController,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Title is required";
                      }

                      if (value!.length < 3) {
                        return "Title should be at least 3 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) {
                      currentItem = currentItem.copyWith(
                          description: value, dateTime: DateTime.now());
                    },
                    controller: descController,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Description is required";
                      }

                      if (value!.length < 3) {
                        return "Description should be at least 3 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context);
                          if (isEditing) {
                            // editing existing entry
                            listController.update(
                              context: context,
                              item: currentItem.copyWith(
                                  dateTime: DateTime.now()),
                            );
                          } else {
                            // creating new entry
                            listController.addItem(context,
                                item: currentItem.copyWith(
                                    dateTime: DateTime.now()));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(isEditing ? "Save" : "Add"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
