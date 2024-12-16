import 'dart:convert';

import 'package:my_profile_app/features/crypto_app/domain/formmodel.dart';
import 'package:my_profile_app/features/crypto_app/presentation/widgets/form.dart';
import 'package:my_profile_app/features/utils/exporter.dart';

import 'package:uuid/uuid.dart';

class FormController extends Notifier<List<FormModel>> {
  // decide initial value/state

  @override
  List<FormModel> build() {
    load();
    return [];
  }

  showForm(BuildContext context, {FormModel? item}) {
    // use dialog for same page form

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MyForm(
        item: item,
      ),
    ));
  }

  final key = 'formlist';
  load() async {
    final data = await storage.read(key: key);
    if (data != null) {
      state = (json.decode(data) as List<dynamic>)
          .map((item) => FormModel.fromJson(item))
          .toList();
    }
  }

  jsonConverter() {
    try {
      const jsondata = '[{"title": "Hello"}, {"title":"Hi"}]';
      // List<Map<String, dynamic>> data = json.decode(jsondata);

      final data = json.decode(jsondata);

      print(data);
      // print(data[0]["title"]);

      final value = List<FormModel>.from(
          data.map((item) => FormModel(title: item["title"])));
      print(value);

      print(json.encode(value[0].toJson()));
    } catch (e, s) {
      print("$e $s");
    }
  }

  store() async {
    await storage.write(
        key: key,
        value: json.encode(state.map((item) => item.toJson()).toList()));
  }

  addItem(BuildContext context, {required FormModel item}) async {
    // using cascade and method of list
    bool doesItemExist =
        state.any((existingItem) => existingItem.title == item.title);
    if (!doesItemExist) {
      state = [
        ...state
          ..add(item.copyWith(id: const Uuid().v6(), dateTime: DateTime.now()))
      ];

      await store();
      // show success snack bar here using context
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Item Added!"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Item already exists!"),
        ),
      );
    }

    // } else {
    //   ref.read(errorMessageProvider.notifier).state =
    //       "An item with the title already exists!";
    // }
  }

  update({required BuildContext context, required FormModel item}) {
    final index = state.indexWhere((value) => value.id == item.id);

    if (index != -1) {
      if (item == state[index]) print("NO changes made");
      updateByIndex(context: context, index: index, newValue: item);
    }
  }

  updateByIndex(
      {required BuildContext context,
      required int index,
      required FormModel newValue}) async {
// update

    state = [...state..[index] = newValue];
    await store();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text("Item Updated!"),
      ),
    );
  }

  Future<void> deleteIndex(BuildContext context, {required int index}) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      state = [...state..removeAt(index)];
      await store();
    }
  }

  delete(FormModel item) {
// remove

    state = [...state..remove(item)];
  }

  compare() {
    FormModel a = const FormModel(title: "title1");
    FormModel b = const FormModel(title: "title2");
    print(a == b);
  }

  clear() {
// clear

    state = [];
  }
}

class FromJson {}
