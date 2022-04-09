import 'package:flutter/material.dart';

import '../model/subject_model.dart';

class PopupSubjectCard extends StatelessWidget {
  const PopupSubjectCard({Key? key, required this.subject}) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(16.0),
        color: Color.fromARGB(0, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Hero(
                    tag: subject.name.hashCode,
                    child: Material(
                      borderRadius: BorderRadius.circular(16.0),
                      child: SubjectInfoBox(subject: subject, color: this.subject.color,)
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SubjectInfoBox extends StatelessWidget {
  const SubjectInfoBox({
    Key? key,
    required this.subject,
    required this.color,
  }) : super(key: key);

  final Subject subject;
  final Color color;

  Color lighten(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * p).round(),
        c.green + ((255 - c.green) * p).round(),
        c.blue + ((255 - c.blue) * p).round()
    );
  }



  @override
  Widget build(BuildContext context) {
    DateTime finishTime = subject.startTime.add(subject.duration);

    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: this.color
      ),
      child: SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text("""${subject.startTime.hour}:${subject.startTime.minute} - ${finishTime.hour}:${finishTime.minute}"""),
            SizedBox(height: 8.0,),
            Visibility(
              visible: subject.description.isNotEmpty,
              child: Container(
                child: Text(subject.description,),
                decoration: BoxDecoration(
                  color: lighten(color, 30),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.all(4.0),

              ),
            )
          ],
        ),
      ),
    );
  }
}


class RightBox extends StatelessWidget {
  const RightBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        )
      ),
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Up next", style: TextStyle(fontSize: 16),),
          UpcomingSubject(title: "Test 1", color: Colors.green,),
          UpcomingSubject(title: "Test 2", color: Colors.orange),
          UpcomingSubject(title: "Test 3", color: Colors.pink),
          UpcomingSubject(title: "Test 4", color: Colors.red)
        ],
      )
    );
  }
}


class UpcomingSubject extends StatelessWidget {
  const UpcomingSubject({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      padding: EdgeInsets.all(4.0),
      child: Center(child: Text(title)),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6.0)),
      width: double.maxFinite,
    );
  }
}
