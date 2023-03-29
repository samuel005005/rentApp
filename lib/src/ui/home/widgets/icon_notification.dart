import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class IconNotification extends StatelessWidget {
  final double iconSize;
  const IconNotification({super.key, required this.iconSize});
  final _sizeIconRed = .266666667;
  final _sizeIconGrey = .333333333;
  final _sizeBackground = 1.666666667;
  final _positionIconRed = .533333333;
  final _positionIconGrey = .5;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: iconSize * _sizeBackground,
          height: iconSize * _sizeBackground,
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
                child: Icon(
                  Ionicons.notifications,
                  size: iconSize,
                  color: const Color(0xff130f26),
                ),
              ),
              Positioned(
                top: iconSize * _positionIconGrey,
                right: iconSize * _positionIconGrey,
                child: Container(
                  width: iconSize * _sizeIconGrey,
                  height: iconSize * _sizeIconGrey,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffcecdd2),
                  ),
                ),
              ),
              Positioned(
                top: iconSize * _positionIconRed,
                right: iconSize * _positionIconRed,
                child: Container(
                  alignment: Alignment.center,
                  width: iconSize * _sizeIconRed,
                  height: iconSize * _sizeIconRed,
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
    );
  }
}
