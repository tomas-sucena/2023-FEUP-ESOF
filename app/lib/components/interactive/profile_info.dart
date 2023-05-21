import 'package:app/services/data/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/volunteer.dart';
import '../../services/data/file_explorer.dart';
import '../../utils/alignment.dart';
import '../../utils/icons/coco_icon.dart';
import '../passive/icon_text.dart';
import '../passive/profile_picture.dart';

class ProfileInfo extends StatefulWidget {
  final Volunteer _volunteer;
  final DatabaseManager _dbManager;
  final FileExplorer _fileExplorer;

  /* CONSTRUCTOR */
  ProfileInfo(Volunteer volunteer, DatabaseManager dbManager)
      : _volunteer = volunteer,
        _dbManager = dbManager,
        _fileExplorer = FileExplorer();

  /* METHODS */
  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  void _changeProfilePicture() async {
    final file = await widget._fileExplorer.getImage(ImageSource.gallery);
    if (file == null) return;

    final String oldImageURL = widget._volunteer.profilePicture.url,
        newImageURL = await widget._dbManager.addFile(file, "profile_pictures");

    // update the profile
    setState(() {
      widget._volunteer.profilePicture = NetworkImage(newImageURL);
    });

    // update the database
    await widget._dbManager.addVolunteer(widget._volunteer);
    await widget._dbManager.removeFile(oldImageURL);
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
                  icon: COCOIcon(
                    iconName: "Email",
                    height: 24,
                  ),
                  text: Text(
                    widget._volunteer.email,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                addVerticalSpace(6),
                IconText(
                  icon: COCOIcon(
                    iconName: "Phone",
                    height: 24,
                  ),
                  text: Text(
                    widget._volunteer.phoneNumber ?? "(NOT SPECIFIED)",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addVerticalSpace(10),
                ProfilePicture(
                  image: widget._volunteer.profilePicture,
                  size: 105,
                ),
                addVerticalSpace(5),
                InkWell(
                  onTap: () {
                    _changeProfilePicture();
                  },
                  child: IconText(
                    icon: COCOIcon(
                      iconName: "Pencil",
                      height: 24,
                    ),
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
      ],
    );
  }
}
