// lib/services/user_service.dart
import 'package:dio/dio.dart';
import '../Models/user_model.dart';

class UserService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));

  Future<List<User>> fetchUsers(int page) async {
    final response = await _dio.get('/users', queryParameters: {'page': page});
    final data = response.data['data'] as List;
    return data.map((json) => User.fromJson(json)).toList();
  }

  Stream<List<User>> fetchUsersStream(int page) async* {
    yield* Stream.periodic(Duration(seconds: 5), (_) async {
      return await fetchUsers(page);
    }).asyncMap((event) async => await event);
  }
}
