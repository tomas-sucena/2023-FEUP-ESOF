import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/event.dart';
import '../../pages/event_page.dart';
import '../../utils/alignment.dart';
import '../../utils/icons/coco_icon.dart';
import '../passive/icon_text.dart';
import '../passive/profile_picture.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventPage(
              event: Event(
                  "Save the turtles!",
                  "Projeto TAMAR",
                  "Porto, Portugal",
                  "tamarproj@gmail.com",
                  "(+351) 937 200 663",
                  "https://lh3.googleusercontent.com/ci/AJFM8ry_EaAf7fSLbdIQB6TlX7qaLX57eBR6l0OFVATGZ6OonoIk4xQFqef8xn9V90cbDR9D-RQTTg",
                  "We will head to the beach in order to help the newborn baby turtles reach the sea.\n\nLet us save the turtles!"),
            ),
          ),
        )
      },
      child: Container(
        height: 100,
        width: 360,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(232, 232, 232, 1.0),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addHorizontalSpace(12),
            const ProfilePicture(
              image: AssetImage("assets/images/pedroanime.png"),
              size: 80,
            ),
            addHorizontalSpace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(8),
                Text(
                  "Save the turtles!",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 32,
                      ),
                ),
                addVerticalSpace(5),
                IconText(
                  icon: COCOIcon(
                    iconName: "Profile",
                    height: 24,
                    themeDependent: false,
                  ),
                  text: Text(
                    "Projeto TAMAR",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
