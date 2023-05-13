import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rest_house_rd/src/config/theme/colors.dart';
import 'package:rest_house_rd/src/features/home/presentation/delegates/search_home_delegate.dart';
import 'package:rest_house_rd/src/features/shared/presentation/provider/theme_provider.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isDark = ref.read(isDarkProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  showSearch(
                    context: context,
                    delegate: SearchHomeDelegate(),
                  );
                }
              },
              child: Container(
                width: size.width * .7,
                height: 50,
                decoration: BoxDecoration(
                  color:
                      isDark ? const Color(0xff212121) : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    Icon(Ionicons.search, color: Colors.grey.shade600),
                    const SizedBox(width: 20),
                    Text("Santo Domingo",
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade600))
                  ],
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                "FILTERS",
                style: TextStyle(
                    color: ColorsApp.foregroundColor,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
