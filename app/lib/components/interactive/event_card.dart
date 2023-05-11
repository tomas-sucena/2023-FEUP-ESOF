import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/alignment.dart';
import '../passive/icon_text.dart';
import '../passive/profile_picture.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        height: 100,
        width: 360,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(232, 232, 232, 1.0),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
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
                  icon: SvgPicture.asset(
                    "assets/images/icons/COCO_Profile.svg",
                    height: 24,
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
