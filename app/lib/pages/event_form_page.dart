import 'package:flutter/material.dart';

import '../components/interactive/my_text_field.dart';
import '../components/passive/icon_text.dart';
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
  final TextEditingController _locationController;
  final TextEditingController _emailController;
  final TextEditingController _phoneNumberController;
  final TextEditingController _descriptionController;
  DateTime _eventDate;

  /* CONSTRUCTOR */
  _EventFormPageState()
      : _nameController = TextEditingController(),
        _locationController = TextEditingController(),
        _emailController = TextEditingController(),
        _phoneNumberController = TextEditingController(),
        _descriptionController = TextEditingController(),
        _eventDate = DateTime.now();

  /* METHODS */
  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _changeEventDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _eventDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 100),
    );

    if (newDate == null) return;

    setState(() {
      _eventDate = newDate;
    });
  }

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                InkWell(
                  onTap: _changeEventDate,
                  child: IconText(
                    icon: COCOIcon(
                      iconName: "Calendar",
                      height: 24,
                    ),
                    text: Text(
                      "${_eventDate.day}/${_eventDate.month}/${_eventDate.year}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          MyTextFormField(
            controller: _nameController,
            color: const Color.fromRGBO(162, 163, 170, 1.0),
            focusedColor: Theme.of(context).primaryColor,
            labelText: "Name",
          ),
          addVerticalSpace(10),
          MyTextFormField(
            controller: _locationController,
            color: const Color.fromRGBO(162, 163, 170, 1.0),
            focusedColor: Theme.of(context).primaryColor,
            labelText: "Location",
          ),
          addVerticalSpace(10),
          MyTextFormField(
            controller: _emailController,
            color: const Color.fromRGBO(162, 163, 170, 1.0),
            focusedColor: Theme.of(context).primaryColor,
            labelText: "Email",
          ),
          addVerticalSpace(10),
          MyTextFormField(
            controller: _phoneNumberController,
            color: const Color.fromRGBO(162, 163, 170, 1.0),
            focusedColor: Theme.of(context).primaryColor,
            labelText: "Phone Number",
          ),
          addVerticalSpace(10),
          MyTextFormField(
            controller: _descriptionController,
            color: const Color.fromRGBO(162, 163, 170, 1.0),
            focusedColor: Theme.of(context).primaryColor,
            labelText: "Description",
          ),
        ],
      ),
    );
  }
}
