import 'package:dio/dio.dart';
import 'package:rugram/data/remote_data_sources/models/list_model.dart'
    as source_source_list_model;
import 'package:rugram/data/remote_data_sources/models/post_preview.dart'
    as source_post_preview;
import 'package:rugram/data/remote_data_sources/models/user_preview.dart'
as source_user_preview;
import 'package:rugram/domain/models/list_model.dart';
import 'package:rugram/domain/models/post_create.dart';
import 'package:rugram/domain/models/post_preview.dart';
import 'package:rugram/domain/models/user_preview.dart';

class PostDataSource {
  final Dio dio;

  PostDataSource(this.dio);

  Future<ListModel<PostPreview>> getPosts({int? page}) async {
    final result = await dio.get(
      '/post',
      queryParameters: {'page': page},
    );

    final model = source_source_list_model.ListModel.fromJson(result.data)
        .toEntity<PostPreview>(
      (a) => source_post_preview.PostPreview.fromJson(a).toEntity(),
    ) as ListModel<PostPreview>;

    return model;
  }

  Future<ListModel<PostPreview>> getPostsByUser({int? page}) async {
    final result = await dio.get(
      '/user/' + '65a9a63d52c5e80be266c14e' + '/post',
      queryParameters: {'page': page},
    );

    final model = source_source_list_model.ListModel.fromJson(result.data)
        .toEntity<PostPreview>(
          (a) => source_post_preview.PostPreview.fromJson(a).toEntity(),
    ) as ListModel<PostPreview>;

    return model;
  }

  Future<void> getPostsByTag() async {}

  Future<void> getPostById() async {}

  Future<void> createPost(PostCreate postCreate) async {}

  Future<void> updatePost(PostCreate postCreate) async {}

  Future<void> deletePost(PostCreate postCreate) async {}
}
