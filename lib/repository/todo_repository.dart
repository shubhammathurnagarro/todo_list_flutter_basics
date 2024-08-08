import 'package:http/http.dart' as http;
import 'package:todo_list_flutter_basics/utils/utils.dart';

import '../models/todo.dart';

class TodoRepository {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<Todo>> getTodoList() async {
    String endpoint = '/todos';
    var response = await http.get(Uri.parse(_baseUrl + endpoint));
    if (response.statusCode == 200) {
      return Utils.parseListResponse(
          response, (element) => Todo.fromJson(element));
    } else {
      throw Exception('Some error occurred!');
    }
  }
}
