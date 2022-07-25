import 'package:flutter/material.dart';

import '../models/model_person.dart';

class FreezdUserPage extends StatelessWidget {
  const FreezdUserPage({Key? key}) : super(key: key);

  Widget buildText({required String title, required String text}) {
    var textStyle = const TextStyle(fontSize: 20);
    var titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    return Wrap(
      children: [
        Text(title, style: titleStyle),
        Text(text, style: textStyle),
      ],
    );
  }

  Widget buildUser(Person user, String userTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(title: '$userTitle ID : ', text: user.id.toString()),
        buildText(title: '$userTitle age : ', text: user.age.toString()),
        buildText(
          title: '$userTitle first Name : ',
          text: user.firstName.toString(),
        ),
        buildText(
          title: '$userTitle Last Name : ',
          text: user.lastName.toString(),
        ),
        buildText(title: '$userTitle toString : ', text: user.toString()),
        buildText(
          title: '$userTitle toJson : ',
          text: user.toJson().toString(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 20);
    var user1 = const Person(
      id: 1,
      age: 20,
      firstName: '홍길동',
      lastName: '길동아',
    );
    var user2 = user1.copyWith(firstName: '신짱구', lastName: '신짱');
    var divider = const Divider(height: 40, thickness: 2, color: Colors.black);

    return Scaffold(
      appBar: AppBar(title: Text('Freezd Page', style: textStyle)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildUser(user1, 'User1'),
            divider,
            buildUser(user2, 'User2'),
          ],
        ),
      ),
    );
  }
}
