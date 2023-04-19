import 'dart:convert';
import 'dart:math';

import 'package:bloc_tutorials/model/post_model.dart';
import 'package:http/http.dart'  as http;
class PostRepository {

  Future<List<PostModel>> fetchPost()async{


      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      final body = json.decode(response.body) as List;
      print(response.statusCode.toString());
      print(body);


      if(response.statusCode == 200){
        return  body.map((dynamic json) {
          final map = json as Map<String, dynamic>;
        return  PostModel(
            id: map['id'] as int,
            title: map['title'] as String,
            body: map['body'] as String,
          );
        }).toList();

    }

      throw Exception('error fetching data');
  }
}