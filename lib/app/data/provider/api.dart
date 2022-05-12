import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:getx_infinitive_list/app/data/model/post.dart';

class ApiClient {
  final String baseURL = 'https://jsonplaceholder.typicode.com/';

  Future<List<Post>> getPost(int start, int limit) async {
    try {
      final url = baseURL + 'posts?_start=$start&_limit=$limit';
      final response = await Dio().get(url);
      if (response.statusCode != 200) {
        throw Exception('Fetch api failed: ${response.statusCode}');
      }
      final jsonResponse = response.data as List<dynamic>;
      final fetchedPosts = jsonResponse.map(
        (e) => Post(
            userId: e['userId'] as int,
            id: e['id'] as int,
            title: e['title'] as String,
            body: e['body'] as String),
      );
      return fetchedPosts.toList();
    } on Exception catch (e) {
      throw e;
    }
  }
}

void main() async {
  final posts = await ApiClient().getPost(0, 20);
}
