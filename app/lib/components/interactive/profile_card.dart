import 'package:app/services/data/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/volunteer.dart';
import '../../services/data/file_explorer.dart';
import '../../utils/alignment.dart';
import '../passive/icon_text.dart';

class ProfileCard extends StatefulWidget {
  final Volunteer _volunteer;
  final DatabaseManager _dbManager;
  final FileExplorer _fileExplorer;

  /* CONSTRUCTOR */
  ProfileCard(Volunteer volunteer, DatabaseManager dbManager)
      : _volunteer = volunteer,
        _dbManager = dbManager,
        _fileExplorer = FileExplorer();

  /* METHODS */
  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  void _changeProfilePicture() async {
    final _file = await widget._fileExplorer.getImage(ImageSource.gallery);
    if (_file == null) return;

    String _imageURL = await widget._dbManager.addFile(_file, "profile_pictures");

    // update the profile
    setState(() {
      widget._volunteer.profilePicture = NetworkImage(_imageURL);
    });

    // update the database
    widget._dbManager.addVolunteer(widget._volunteer);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(5),
                Text(
                  widget._volunteer.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget._volunteer.eventsAttended.toString(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    addHorizontalSpace(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addVerticalSpace(12),
                        Text(
                          'Charity Events\nAttended',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                addVerticalSpace(18),
                IconText(
                  icon: SvgPicture.asset("assets/images/icons/COCO_Email.svg"),
                  text: Text(
                    widget._volunteer.email,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addVerticalSpace(5),
                CircleAvatar(
                  radius: 52.5,
                  backgroundImage: widget._volunteer.profilePicture,
                ),
                addVerticalSpace(5),
                InkWell(
                  onTap: () {
                    _changeProfilePicture();
                  },
                  child: IconText(
                    icon:
                        SvgPicture.asset("assets/images/icons/COCO_Pencil.svg"),
                    text: Text(
                      "Edit",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        addVerticalSpace(10),
        Center(
          child: Text(
            'Recent Events',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ],
    );
  }
}
