import 'package:app/services/data/database_manager.dart';
import 'package:flutter/material.dart';

import '../components/interactive/my_button.dart';
import '../components/interactive/my_text_box.dart';
import '../components/interactive/my_text_field.dart';
import '../components/passive/icon_text.dart';
import '../models/charity_event.dart';
import '../models/volunteer.dart';
import '../utils/alignment.dart';
import '../utils/icons/coco_icon.dart';

class EventFormPage extends StatefulWidget {
  final Volunteer _organizer;
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  const EventFormPage(
      {required Volunteer organizer,
      required DatabaseManager dbManager,
      Key? key})
      : _organizer = organizer,
        _dbManager = dbManager,
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
  final List<GlobalKey<FormState>> _keys;

  /* CONSTRUCTOR */
  _EventFormPageState()
      : _nameController = TextEditingController(),
        _locationController = TextEditingController(),
        _emailController = TextEditingController(),
        _phoneNumberController = TextEditingController(),
        _descriptionController = TextEditingController(),
        _eventDate = DateTime.now(),
        _keys = [
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
          GlobalKey<FormState>(),
        ];

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

  bool _validateUserInput() {
    for (GlobalKey<FormState> key in _keys) {
      FormState? state = key.currentState;

      if (state == null || !state.validate()) return false;
    }

    return true;
  }

  Future<bool> _showWarning() async {
    late bool answer;

    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          "Please note that any event submitted cannot be changed.\n"
          '\n'
          "Are you sure you want to proceed?",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              answer = true;
            },
            child: Text(
              "Yes",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              answer = false;
            },
            child: const Text("No"),
          ),
        ],
      ),
    );

    return answer;
  }

  void _showLoadingScreen() {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: const CircularProgressIndicator(
          color: const Color.fromRGBO(233, 161, 136, 1),
        ),
      ),
    );
  }

  void _submitEvent() async {
    if (!_validateUserInput() || !await _showWarning()) return;

    final CharityEvent event = CharityEvent(
      name: _nameController.text.trim(),
      organizerID: widget._organizer.id,
      organizerName: widget._organizer.name,
      date: _eventDate,
      location: _locationController.text.trim(),
      email: _emailController.text.trim(),
      phoneNumber: _phoneNumberController.text.trim(),
      description: _descriptionController.text.trim(),
      profilePicture: widget._organizer.profilePicture,
    );

    _showLoadingScreen();
    widget._organizer.organizedEvents.add(event);

    // update the database
    await widget._dbManager.addEvent(event);
    await widget._dbManager.addVolunteer(widget._organizer);

    Navigator.of(
      context,
      rootNavigator: true,
    ).pop(); // discard the loading screen
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
      body: SingleChildScrollView(
        child: Column(
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
            addVerticalSpace(10),
            MyTextField(
              controller: _nameController,
              inputType: MyInputType.name,
              key: _keys[0],
              color: const Color.fromRGBO(162, 163, 170, 1.0),
              focusedColor: Theme.of(context).primaryColor,
            ),
            addVerticalSpace(5),
            MyTextField(
              controller: _locationController,
              inputType: MyInputType.name,
              key: _keys[1],
              color: const Color.fromRGBO(162, 163, 170, 1.0),
              focusedColor: Theme.of(context).primaryColor,
              label: "Location",
            ),
            addVerticalSpace(5),
            MyTextField(
              controller: _emailController,
              inputType: MyInputType.email,
              key: _keys[2],
              color: const Color.fromRGBO(162, 163, 170, 1.0),
              focusedColor: Theme.of(context).primaryColor,
              hint: widget._organizer.email,
            ),
            addVerticalSpace(5),
            MyTextField(
              controller: _phoneNumberController,
              inputType: MyInputType.phoneNumber,
              key: _keys[3],
              color: const Color.fromRGBO(162, 163, 170, 1.0),
              focusedColor: Theme.of(context).primaryColor,
              hint: widget._organizer.phoneNumber,
            ),
            addVerticalSpace(25),
            MyTextBox(
              controller: _descriptionController,
              key: _keys[4],
              color: const Color.fromRGBO(162, 163, 170, 1.0),
              focusedColor: Theme.of(context).primaryColor,
              label: "Description",
              hint: "Write a brief description of your event.",
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
            addVerticalSpace(20),
            MyButton(
              onTap: _submitEvent,
              text: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
