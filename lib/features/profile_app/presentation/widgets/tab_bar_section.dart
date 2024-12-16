import 'package:flutter/material.dart';

class TabBarSection extends StatefulWidget {
  const TabBarSection({super.key});

  @override
  _TabBarSectionState createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.grid_on),
                    SizedBox(width: 8),
                    Text("Post"),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('@',
                        style:
                            TextStyle(fontSize: 24)), // Using Text for @ symbol
                    SizedBox(width: 8),
                    Text("Mention"),
                  ],
                ),
              ),
            ],
          ),
          // Container(
          //   height: 300,
          //   child: TabBarView(
          //     controller: _tabController,
          //     children: const [
          //       Center(child: Text("Posts")),
          //       Center(child: Text("Mentions")),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
