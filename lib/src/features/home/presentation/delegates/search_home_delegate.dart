import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rest_house_rd/src/config/theme/colors.dart';

class SearchHomeDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search city, neighborhood o school';
  @override
  TextStyle? get searchFieldStyle =>
      const TextStyle(fontSize: 15, fontWeight: FontWeight.w300);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        child: IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear),
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_outlined,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("Hola");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(Ionicons.location, color: ColorsApp.foregroundColor),
          title: Text(
            "Nearby",
            style: TextStyle(
                color: ColorsApp.foregroundColor, fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          title: Text(
            "Recenty Searches",
            style: TextStyle(
                color: Colors.grey.shade600, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            ListTile(
              leading: Icon(
                color: Colors.grey.shade500,
                FontAwesomeIcons.solidClock,
              ),
              title: const Text(
                "New York",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
            ListTile(
              leading: Icon(
                color: Colors.grey.shade500,
                FontAwesomeIcons.solidClock,
              ),
              title: const Text(
                "Canada",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ))
      ],
    );
  }
}
