import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_infinitive_list/app/data/repository/PostRepository.dart';

import '../data/model/post.dart';

class HomeController extends GetxController {
  final PostRepository postRepository;

  HomeController({required this.postRepository})
      : assert(postRepository != null);

  final posts = <Post>[].obs;
  var isMaxPosts = false.obs;
  var isFetching = false;

  @override
  void onInit() {
    super.onInit();
    fetchMore(20);
  }

  fetchMore(int limit) async {
    if (isMaxPosts.value) return;
    isFetching = true;
    final fetchedPost = await postRepository.getPosts(posts.length, limit);
    if (fetchedPost.isEmpty) {
      isMaxPosts.value = true;
      return;
    }
    posts.addAll(fetchedPost);
    isFetching = false;
  }
}
