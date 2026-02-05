import 'package:flutter/material.dart';
import 'widgets/custom_search_bar.dart';
import 'widgets/quick_action_row.dart';
import 'widgets/waterfall_feed.dart';
import 'widgets/sliver_header_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _searchController;

  // Tabs configuration
  final List<String> _tabs = ['关注', '发现', '北京', '游记', '直播'];

  // Search state
  String _searchKeyword = '';

  @override
  void initState() {
    super.initState();
    // Initialize TabController with initialIndex: 0 to start on the first tab ("关注")
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: 0,
    );
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose(); // Prevent memory leak
    super.dispose();
  }

  void _performSearch(String query) {
    setState(() {
      _searchKeyword = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              // Search Bar
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: CustomSearchBar(
                    controller: _searchController,
                    onSubmitted: _performSearch,
                    // Directly call _performSearch since it's an instance method and never null
                    onClear: () => _performSearch(''),
                  ),
                ),
              ),
              // Quick Actions
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: const QuickActionRow(),
                ),
              ),
              // Sticky TabBar
              SliverPersistentHeader(
                delegate: SliverHeaderDelegate(
                  TabBar(
                    controller: _tabController,
                    // Set isScrollable to false to make tabs distribute evenly across the width
                    isScrollable: false,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(fontSize: 16),
                    indicatorColor: Colors.pinkAccent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    // Removed horizontal padding to ensure even distribution takes up full width
                    padding: EdgeInsets.zero,
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: _tabs.map((tabName) {
              return WaterfallFeed(
                category: tabName,
                searchKeyword: _searchKeyword,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
