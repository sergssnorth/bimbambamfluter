import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rugram/features/profile/widgets/profile_info.dart';

import '../../../data/remote_data_sources/models/user_preview.dart';
import '../../../data/remote_data_sources/post/post_data_source.dart';
import '../../../data/remote_data_sources/profile/profile_data_source.dart';

class ProfileInformationState extends State<ProfileInformation> {
  late final ProfileDataSource profileDataSource;
  late UserPreview user;
  //final picker = ImagePicker();
  String Photo = "...";
  //XFile? image;

  //XFile? get imageProfile => image;

  @override
  void initState() {
    super.initState();
    profileDataSource = context.read<ProfileDataSource>();
    init();
  }

  Future<void> init() async {
    String userId = '65a9a63d52c5e80be266c14e';
    final usersInfo = await profileDataSource.getUserInfo(userId);
    user = usersInfo.data;
    Photo = user.picture;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(widget.imageUrls), // Замените на реальный URL аватара
          ),
          SizedBox(width: 16.0), // Добавим промежуток между фото и текстом
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.firstName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Биография пользователя...'),
                // Добавьте другие элементы информации о пользователе по вашему усмотрению
              ],
            ),
          ),
        ],
      ),
    );
  }
}