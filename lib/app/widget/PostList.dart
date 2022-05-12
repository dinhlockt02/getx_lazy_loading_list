import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import 'bottom_loader.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      final homeController = Get.find<HomeController>();
      if (_isBottom && !homeController.isFetching) {
        homeController.fetchMore(20);
      }
    });
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Obx(
      () => ListView.separated(
        itemCount: homeController.isMaxPosts.value
            ? homeController.posts.length
            : homeController.posts.length + 1,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (ctx, index) => index >= homeController.posts.length
            ? const BottomLoader()
            : ListTile(
                leading: CircleAvatar(
                  child: Text(homeController.posts[index].id.toString()),
                ),
                title: Text(
                  homeController.posts[index].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  homeController.posts[index].body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
        controller: _scrollController,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}
