import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Search extends StatelessWidget {
  final String placeHolder;

  const Search({super.key, required this.placeHolder});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        Expanded(
          child: TextField(
            cursorColor: const Color(0xfffd6d7a),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
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
          width: 50,
          height: 50,
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
            child: const Icon(
              Ionicons.search_outline,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
