import 'dart:convert';

import 'package:tif_assignment/models/post_data_model.dart';
import 'package:http/http.dart' as http;

class AppRepos {
  static Future<List<PostDataModel>> fetchPosts(String url) async {
    List<PostDataModel> postDataModels = [];
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(url));
      var decodedData = jsonDecode(response.body);

      List postsLists = decodedData["content"]["data"];

      for (int i = 0; i < postsLists.length; i++) {
        PostDataModel postData = PostDataModel.fromJson(postsLists[i]);
        postDataModels.add(postData);
      }
      return postDataModels;
    } catch (e) {
      return [];
    }
  }
}
