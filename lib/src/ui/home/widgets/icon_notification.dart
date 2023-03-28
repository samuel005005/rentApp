import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class IconNotification extends StatelessWidget {
  const IconNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 15,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 50,
                  spreadRadius: -15,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Icon(
                    Ionicons.notifications,
                    size: 25,
                    color: Color(0xff130f26),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffcecdd2),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    alignment: Alignment.center,
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
