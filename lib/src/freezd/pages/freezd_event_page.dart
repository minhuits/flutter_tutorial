import 'package:flutter/material.dart';

import '../models/models.dart';

class FreezdEventPage extends StatelessWidget {
  const FreezdEventPage({Key? key}) : super(key: key);

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

  Widget buildUserEvent(Person user, String userTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(
          title: '$userTitle UserEvent : ',
          text: userEvent(person: user),
        ),
        buildText(
          title: '$userTitle UserEvent Loading: ',
          text: userEvent(person: user, eventPerson: PersonEvent.loading()),
        ),
        buildText(
          title: '$userTitle UserEvent Error: ',
          text: userEvent(
            person: user,
            eventPerson: PersonEvent.error(),
          ),
        ),
      ],
    );
  }

  String userEvent({required Person person, PersonEvent? eventPerson}) {
    var event = eventPerson ?? PersonEvent(person: person);

    return event.when(
      (person, statusCode) => person.toJson().toString(),
      loading: (statusCode) => 'Loading...',
      error: (massage, statusCode) => massage ?? '$statusCode Error!',
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
    var divider = const Divider(
      height: 40,
      thickness: 2,
      color: Colors.black,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Freezd Page', style: textStyle)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildUserEvent(user1, 'User1 Event'),
            divider,
            buildUserEvent(user2, 'User2 Event'),
          ],
        ),
      ),
    );
  }
}
