import 'package:getx_infinitive_list/app/data/provider/api.dart';

import '../model/post.dart';

class PostRepository {
  final ApiClient apiClient;

  PostRepository({required this.apiClient}) : assert(apiClient != null);

  Future<List<Post>> getPosts(int start, int limit) async {
    return apiClient.getPost(start, limit);
  }
}
