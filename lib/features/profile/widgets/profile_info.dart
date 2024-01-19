import 'package:flutter/material.dart';
import 'package:rugram/features/profile/widgets/profile_info_state.dart';

class ProfileInformation extends StatefulWidget {
  const ProfileInformation({
    super.key,
    required this.imageUrls,
    required this.firstName,
    required this.lastName,
  });

  final String imageUrls;
  final String firstName;
  final String lastName;

  @override
  ProfileInformationState createState() => ProfileInformationState();
}
