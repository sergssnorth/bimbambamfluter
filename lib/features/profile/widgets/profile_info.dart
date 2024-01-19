import 'package:flutter/material.dart';

class ProfileInformationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('avatar.jpg'), // Замените на реальный URL аватара
          ),
          SizedBox(height: 16.0),
          Text(
            'Имя пользователя',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Биография пользователя...'),
          // Добавьте другие элементы информации о пользователе по вашему усмотрению
        ],
      ),
    );
  }
}