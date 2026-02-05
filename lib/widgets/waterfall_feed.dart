import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/post.dart';
import 'post_card.dart';

class WaterfallFeed extends StatefulWidget {
  final String category;
  final String? searchKeyword;

  const WaterfallFeed({super.key, required this.category, this.searchKeyword});

  @override
  State<WaterfallFeed> createState() => _WaterfallFeedState();
}

class _WaterfallFeedState extends State<WaterfallFeed>
    with AutomaticKeepAliveClientMixin {
  late List<Post> _allPosts;
  late List<Post> _displayPosts;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initPosts();
  }

  @override
  void didUpdateWidget(WaterfallFeed oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      _initPosts();
    } else if (oldWidget.searchKeyword != widget.searchKeyword) {
      _filterPosts();
    }
  }

  void _initPosts() {
    // 1. Create a larger dataset to simulate a real feed
    List<Post> expandedList = [...MOCK_POSTS, ...MOCK_POSTS];

    // 2. Deterministic Shuffle based on category
    final random = Random(widget.category.hashCode);
    expandedList.shuffle(random);

    // 3. Variation in length
    if (widget.category == '关注') {
      _allPosts = expandedList.sublist(0, 10);
    } else if (widget.category == '直播') {
      _allPosts = expandedList.sublist(0, 12);
    } else {
      _allPosts = expandedList;
    }

    _filterPosts();
  }

  void _filterPosts() {
    final keyword = widget.searchKeyword?.trim();
    if (keyword == null || keyword.isEmpty) {
      _displayPosts = _allPosts;
    } else {
      _displayPosts = _allPosts.where((post) {
        return post.title.contains(keyword) ||
            post.userName.contains(
              keyword,
            ); // Changed from authorName to userName
      }).toList();
    }

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_displayPosts.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            '没有找到"${widget.searchKeyword}"相关内容',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return MasonryGridView.count(
      key: PageStorageKey<String>(
        '${widget.category}_${widget.searchKeyword ?? ""}',
      ),
      padding: const EdgeInsets.all(8),
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      physics: const ClampingScrollPhysics(),
      cacheExtent: 500,
      itemCount: _displayPosts.length,
      itemBuilder: (context, index) {
        return PostCard(post: _displayPosts[index]);
      },
    );
  }
}
