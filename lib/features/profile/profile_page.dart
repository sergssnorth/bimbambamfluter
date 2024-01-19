import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/photo_grid.dart';
import 'widgets/profile_info.dart';
import 'package:rugram/data/remote_data_sources/post/post_data_source.dart';
import 'bloc/user_info_cubit.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  //late final UserInfoCubit userInfoCubit;
  late final PostDataSource profileDataSource;

  @override
  void initState() {
    //userInfoCubit = UserInfoCubit(context.read())..init();
    super.initState();

  }

  Future<void> fetchData() async {
    try {
      final data = await profileDataSource.getUserInfo("65a9a63d52c5e80be266c14e");
      setState(() {
        username = data['username'];
        avatarUrl = data['avatarUrl'];
        userPhotos = List<String>.from(data['userPhotos']);
      });
    } catch (error) {
      // Обработка ошибки при выполнении запроса
      print('Error: $error');
    }

  List<String> userPhotos = [
    'https://i.postimg.cc/fbvkYCVk/image.png%22,',
    'https://i.postimg.cc/fbvkYCVk/image.png%22,',
    'https://i.postimg.cc/fbvkYCVk/image.png%22,',
    // Добавьте здесь реальные URL фотографий пользователя
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Имя пользователя'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileInformationWidget(avatarUrl: avatarUrl, username: username),
            PhotoGridWidget(userPhotos: userPhotos),
          ],
        ),
      ),
    );
  }
}