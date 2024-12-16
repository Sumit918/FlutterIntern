import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_profile_app/features/crypto_app/presentation/state/formstate.dart';

class ListTracker extends ConsumerWidget {
  const ListTracker({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final listLength = ref.watch(formProvider.select(
      (value) => value.length,
    ));
    final listController = ref.read(formProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Tracker'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.tealAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  itemBuilder: (context, index) {
                    return Consumer(builder: (context, ref, child) {
                      final item = ref.watch(formProvider.select((value) =>
                          value.length > index ? value[index] : null));
                      return Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.teal.shade50],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            onTap: () {
                              listController.showForm(context, item: item);
                            },
                            trailing: IconButton(
                              onPressed: () {
                                listController.deleteIndex(context,
                                    index: index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                            title: Text(
                              "${item?.title}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.teal,
                              ),
                            ),
                            subtitle: Text(
                              "${item?.description}",
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.teal,
                              child: Text(
                                "${item?.dateTime?.hour}:${item?.dateTime?.minute}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: listLength,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listController.showForm(context);
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
