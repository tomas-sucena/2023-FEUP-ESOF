import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/alignment.dart';
import '../../utils/icons/coco_icon.dart';
import '../../utils/themes/theme_manager.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 360,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(233, 161, 136, 1.0),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            offset: Offset(0, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer<ThemeManager>(
            builder: (context, themeManager, child) {
              return IconButton(
                icon: themeManager.getIcon(),
                onPressed: () => themeManager.switchTheme(),
              );
            },
          ),
          addHorizontalSpace(250), // future search bar
          IconButton(
            icon: COCOIcon(
              iconName: "Loupe",
              height: 40,
              themeDependent: false,
            ),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
