import 'package:flutter/material.dart';
import 'widgets/photo_grid.dart';
import 'widgets/profile_info.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late final ScrollController scrollController;
  //late final HomePostsCubit postsCubit;

  @override
  void initState() {
    //scrollController = ScrollController()..addListener(listenScroll);
    //postsCubit = HomePostsCubit(context.read())..init();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
            ProfileInformationWidget(),
            PhotoGridWidget(userPhotos: userPhotos),
          ],
        ),
      ),
    );
  }
}