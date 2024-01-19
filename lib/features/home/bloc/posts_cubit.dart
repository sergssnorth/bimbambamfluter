import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rugram/data/remote_data_sources/post/post_data_source.dart';
import 'package:rugram/domain/models/list_model.dart';
import 'package:rugram/domain/models/post_preview.dart';

sealed class PostsState {}

class PostsInitialState extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsLoadedState extends PostsState {
  final ListModel<PostPreview> postsInfo;

  PostsLoadedState({
    required this.postsInfo,
  });
}

class HomePostsCubit extends Cubit<PostsState> {
  final PostDataSource postDataSource;

  int page = 1;

  HomePostsCubit(this.postDataSource) : super(PostsInitialState());

  Future<void> init() async {
    emit(PostsLoadingState());
    page = 1;
    final postsInfo = await postDataSource.getPosts(page: page);
    emit(PostsLoadedState(postsInfo: postsInfo));
  }

  Future<void> nextPage() async {
    final oldState = state;

    if (oldState is! PostsLoadedState) {
      return;
    }

    emit(PostsLoadingState());

    final postsInfo = await postDataSource.getPosts(page: ++page);

    emit(
      PostsLoadedState(
        postsInfo: ListModel<PostPreview>(
          data: [
            ...oldState.postsInfo.data,
            ...postsInfo.data,
          ],
          total: postsInfo.total,
          limit: postsInfo.limit,
          page: postsInfo.page,
        ),
      ),
    );
  }
}

class UserPostsCubit extends Cubit<PostsState> {
  final PostDataSource postDataSource;

  int page = 0;

  UserPostsCubit(this.postDataSource) : super(PostsInitialState());

  Future<void> init() async {
    emit(PostsLoadingState());
    page = 0;
    final postsInfo = await postDataSource.getPostsByUser(page: page);
    emit(PostsLoadedState(postsInfo: postsInfo));
  }

  Future<void> nextPage() async {
    final oldState = state;

    if (oldState is! PostsLoadedState) {
      return;
    }

    emit(PostsLoadingState());

    final postsInfo = await postDataSource.getPostsByUser(page: ++page);

    emit(
      PostsLoadedState(
        postsInfo: ListModel<PostPreview>(
          data: [
            ...oldState.postsInfo.data,
            ...postsInfo.data,
          ],
          total: postsInfo.total,
          limit: postsInfo.limit,
          page: postsInfo.page,
        ),
      ),
    );
  }
}

