import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rugram/data/remote_data_sources/post/post_data_source.dart';
import 'package:rugram/domain/models/user_preview.dart';

sealed class UserInfoState {}

class UserInfoInitialState extends UserInfoState {}
class UserInfoLoadingState extends UserInfoState {}
class UserInfoLoadedState extends UserInfoState {
  final UserPreview userInfo;

  UserInfoLoadedState({
    required this.userInfo,
  });
}

class UserInfoCubit extends Cubit<UserInfoState> {
  final PostDataSource postDataSource;
  String user_id = "65a9a63d52c5e80be266c14e";

  UserInfoCubit(this.postDataSource) : super(UserInfoInitialState());

  Future<void> init() async {
    emit(UserInfoLoadingState());
    user_id = "65a9a63d52c5e80be266c14e";
    final userInfo = await postDataSource.getUserInfo(user_id);
    emit(UserInfoLoadedState(userInfo: userInfo));
  }
}

