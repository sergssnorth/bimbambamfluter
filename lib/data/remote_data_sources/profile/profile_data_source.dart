import 'package:dio/dio.dart';

import '../../../domain/models/list_model.dart';
import '../../../domain/models/user_preview.dart';
import 'package:rugram/data/remote_data_sources/models/user_preview.dart' as source_user_preview;

class ProfileDataSource {
  final Dio dio;

  ProfileDataSource(this.dio);
// получение списка профилей
  Future<UserPreview> getUserInfo(String userId) async {
    try {
      final result = await dio.get('/user/$userId');

      if (result.statusCode == 200) {
        return source_user_preview.UserPreview.fromJson(result.data).toEntity();


      } else {
        // Обработка ошибок, например, если ответ не успешен
        throw Exception('Failed to load user information');
      }
    } catch (error) {
      // Обработка ошибок при выполнении запроса
      throw Exception('Error: $error');
    }

  }

  Future<UserPreview> updateUser(
      {required String userId, required String name}) async {
    final result = await dio.put(
        '/user/$userId',
        data: {
          'firstName': name,
        }
    );

    var userPreview = source_user_preview.UserPreview.fromJson(result.data).toEntity();
    return userPreview;
  }
}