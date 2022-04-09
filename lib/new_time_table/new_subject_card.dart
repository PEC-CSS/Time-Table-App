import 'package:flutter/material.dart';
import 'package:time_table_app/database/database.dart';
import 'package:time_table_app/model/subject_model.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class NewSubject extends StatefulWidget {
  NewSubject(this.day, {Key? key}) : super(key: key);
  final int day;

  @override
  State<NewSubject> createState() => _NewSubjectState();
}

class _NewSubjectState extends State<NewSubject> {
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(hours: 1));

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Color currentColor = Colors.red;

  void changeStartTime(TimeOfDay newTime) {
    DateTime current = DateTime.now();
    startTime = DateTime(
        current.year, current.month, current.day, newTime.hour, newTime.minute);
  }

  void changeEndTime(TimeOfDay newTime) {
    DateTime current = DateTime.now();
    endTime = DateTime(
        current.year, current.month, current.day, newTime.hour, newTime.minute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: titleController,
          decoration: InputDecoration(
            hintText: "Title",
            border: InputBorder.none,
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimeButton(
                    TimeOfDay.fromDateTime(startTime).replacing(minute: 0),
                    label: "Start: ",
                    callback: changeStartTime),
                TimeButton(
                  TimeOfDay.fromDateTime(endTime).replacing(minute: 0),
                  label: "End: ",
                  callback: changeEndTime,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final colorBeforeDialog = currentColor;

              if (!await ColorPicker(
                color: currentColor,
                onColorChanged: (Color col) {
                  setState(() {
                    currentColor = col;
                  });
                },
                pickersEnabled: const <ColorPickerType, bool>{
                  ColorPickerType.both: false,
                  ColorPickerType.primary: true,
                  ColorPickerType.accent: false,
                  ColorPickerType.bw: false,
                  ColorPickerType.custom: false,
                  ColorPickerType.wheel: false,
                },
                width: 44,
                height: 44,
                borderRadius: 22,
                heading: Text(
                  'Select color',
                  style: Theme.of(context).textTheme.headline6,
                ),
                subheading: Text(
                  'Select color shade',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ).showPickerDialog(context)) {
                setState(() {
                  currentColor = colorBeforeDialog;
                });
              }
            },
            child: Text("Color"),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(currentColor)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Description",
            ),
            textCapitalization: TextCapitalization.sentences,
            minLines: 6,
            maxLines: null,
          ),
          ElevatedButton(
            child: Text("Add"),
            onPressed: () {
              String title = titleController.text;
              Duration duration = endTime.difference(startTime);
              String desc = descriptionController.text.trim();
              Subject newSubject = Subject(
                  name: title,
                  description: desc,
                  startTime: startTime,
                  duration: duration,
                  color: currentColor
              );

              Database.addNewSubject(newSubject, this.widget.day);
            },
          )
        ],
      ),
    );
  }
}

class TimeButton extends StatefulWidget {
  TimeButton(this.time, {Key? key, required this.label, required this.callback})
      : super(key: key);

  final String label;
  final TimeOfDay time;
  final void Function(TimeOfDay) callback;

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  TimeOfDay time = TimeOfDay.now();
  void setNewTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: time.replacing(minute: 0),
    );
    setState(() {
      if (newTime != null) {
        time = newTime;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    time = widget.time;
    widget.callback(time);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () => setNewTime(context),
          child: Text(
            time.hour.toString().padLeft(2, '0') +
                ":" +
                time.minute.toString().padLeft(2, '0'),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.bottomCenter),
        ),
      ],
    );
  }
}
