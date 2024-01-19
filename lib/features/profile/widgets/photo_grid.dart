import 'package:flutter/material.dart';

class PhotoGridWidget extends StatelessWidget {
  final List<String> userPhotos;

  PhotoGridWidget({required this.userPhotos});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: userPhotos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showFullScreenImage(context, userPhotos[index]);
            },
            child: Image.asset(
              userPhotos[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  void showFullScreenImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}