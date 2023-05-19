import 'package:app/components/interactive/my_text_field.dart';
import 'package:flutter/material.dart';

import '../models/volunteer.dart';
import '../utils/alignment.dart';
import '../utils/icons/coco_icon.dart';

class EventFormPage extends StatefulWidget {
  final Volunteer _volunteer;

  /* CONSTRUCTOR */
  const EventFormPage({required Volunteer volunteer, Key? key})
      : _volunteer = volunteer,
        super(key: key);

  /* METHOD */
  @override
  State<EventFormPage> createState() => _EventFormPageState();
}

class _EventFormPageState extends State<EventFormPage> {
  final TextEditingController _nameController;
  final TextEditingController _descriptionController;

  /* CONSTRUCTOR */
  _EventFormPageState()
      : _nameController = TextEditingController(),
        _descriptionController = TextEditingController();

  /* METHODS */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: COCOIcon(
            iconName: "Left_arrow",
            height: 35,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          addVerticalSpace(40),
          Center(
            child: Text(
              'New event',
              style: TextStyle(
                fontSize: 40,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          addVerticalSpace(20),
          MyTextFormField(
            controller: _nameController,
            inputType: InputType.text,
            color: const Color.fromRGBO(162, 163, 170, 1.0),
            focusedColor: Theme.of(context).primaryColor,
            labelText: "Name",
          ),
          addVerticalSpace(10),
          MyTextFormField(
            controller: _descriptionController,
            color: const Color.fromRGBO(162, 163, 170, 1.0),
            inputType: InputType.description,
          )
        ],
      ),
    );
  }
}
