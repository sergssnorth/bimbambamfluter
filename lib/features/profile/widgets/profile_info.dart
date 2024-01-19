import 'package:flutter/material.dart';
import 'package:rugram/features/profile/widgets/profile_info_state.dart';

class ProfileInformation extends StatefulWidget {
  const ProfileInformation({
    super.key,
    required this.imageUrls,
    required this.firstName,
  });

  final String imageUrls;
  final String firstName;

  @override
  ProfileInformationState createState() => ProfileInformationState();
}
