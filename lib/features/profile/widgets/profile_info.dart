import 'package:flutter/material.dart';

class ProfileInformationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage('avatar.jpg'), // Замените на реальный URL аватара
          ),
          SizedBox(width: 16.0), // Добавим промежуток между фото и текстом
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
          ),
        ],
      ),
    );
  }
}