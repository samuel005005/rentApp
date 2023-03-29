import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Search extends StatelessWidget {
  final String placeHolder;
  final double iconSize;

  const Search({super.key, required this.placeHolder, required this.iconSize});
  final double _sizebutton = 1.5625;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: iconSize * 0.9375),
        Flexible(
          child: TextField(
            cursorColor: const Color(0xfffd6d7a),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: iconSize * 0.5, horizontal: iconSize * 0.3125),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1,
                  color: Color(0xffededee),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1,
                  color: Color(0xfffd6d7a),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 66, 125, 145),
                ),
              ),
              hintText: placeHolder,
              hintStyle: const TextStyle(
                color: Color(0xffd4d4d4),
              ),
            ),
          ),
        ),
        const SizedBox(width: 30),
        Container(
          width: iconSize * _sizebutton,
          height: iconSize * _sizebutton,
          decoration: BoxDecoration(
            color: const Color(0xfffd6d7a),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 50,
                spreadRadius: -15,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Container(
            alignment: Alignment.center,
            child: Icon(
              Ionicons.search_outline,
              size: iconSize,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: iconSize * 0.9375),
      ],
    );
  }
}
