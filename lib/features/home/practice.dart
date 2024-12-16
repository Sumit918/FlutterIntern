import 'package:flutter/material.dart';

class Challenge1 extends StatelessWidget {
  const Challenge1({super.key});
  Widget buildItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget widget,
    required int number,
  }) {
    return Container(
      width: double.infinity,
      color: Colors.blueGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Text(
            number.toString(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile'),
      ),
      body: Container(
        color: Colors.green,
        child: Expanded(
          child: Column(
            children: [
              buildItem(context,
                  title:
                      "qefdasfadfadsfadsfdsafdasfdasfadsfdasfasfewrqwerqewrqwerwhhjkhdsjkfajkdsnfjasdnfjsnjfasdfhjkasdfjasfjkadshf",
                  subtitle: "Practice column and row",
                  icon: Icons.add,
                  widget: const Challenge1(),
                  number: 1),
              buildItem(context,
                  title: "Column and Row",
                  subtitle: "Practice column and row",
                  icon: Icons.add,
                  widget: const Challenge1(),
                  number: 2),
            ],
          ),
        ),
      ),
    );
  }
}
