import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class CustomButtonNavigator extends StatelessWidget {
  final int currentIndex;
  const CustomButtonNavigator({
    super.key,
    required this.currentIndex,
  });

  void onItemTapped(BuildContext context, int index) {
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (value) => onItemTapped(context, value),
      items: const [
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(Ionicons.search),
        ),
        BottomNavigationBarItem(
          label: "Saves",
          icon: Icon(Ionicons.heart),
        ),
        BottomNavigationBarItem(
          label: "Alerts",
          icon: Icon(Ionicons.notifications),
        ),
        BottomNavigationBarItem(
          label: "More",
          icon: Icon(FontAwesomeIcons.ellipsis),
        ),
      ],
    );
  }
}
