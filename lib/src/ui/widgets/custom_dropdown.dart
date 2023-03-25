import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String text;
  const CustomDropDown({super.key, required this.text});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late GlobalKey actionKey;
  bool isDropDownOpened = false;
  late double height, width, xPosition, yPosition;
  late OverlayEntry floatingDropdown;
  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropDownOpened) {
            floatingDropdown.remove();
          } else {
            findDropdownData();
            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context).insert(floatingDropdown);
          }

          isDropDownOpened = !isDropDownOpened;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.red.shade600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            Text(
              widget.text.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            const Icon(Icons.arrow_drop_down_outlined),
          ],
        ),
      ),
    );
  }

  void findDropdownData() {
    RenderBox renderBox =
        actionKey.currentContext?.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;

    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    print(yPosition);
    print(xPosition);
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height,
        height: 4 * height + 40,
        child: _Dropdown(
          itemHeight: height,
        ),
      );
    });
  }
}

class _Dropdown extends StatelessWidget {
  final double itemHeight;
  const _Dropdown({required this.itemHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Align(
          alignment: const Alignment(-0.8, 0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              width: 30,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.red.shade600,
              ),
            ),
          ),
        ),
        Material(
          elevation: 20,
          shape: ArrowShape(),
          child: Container(
            height: 4 * itemHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                DropdownItem.first(
                  text: "Add new",
                  iconData: Icons.add_circle_outline,
                ),
                const DropdownItem(
                  isSelectd: true,
                  text: "View Profile",
                  iconData: Icons.person_2_outlined,
                ),
                const DropdownItem(
                  text: "Setting",
                  iconData: Icons.settings,
                ),
                DropdownItem.last(
                  text: "Logout",
                  iconData: Icons.exit_to_app,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownItem extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool isSelectd;
  final bool isFirstItem;
  final bool isLastItem;

  const DropdownItem({
    super.key,
    required this.text,
    required this.iconData,
    this.isSelectd = false,
    this.isFirstItem = false,
    this.isLastItem = false,
  });

  factory DropdownItem.first({
    required String text,
    required IconData iconData,
    bool isSelectd = false,
  }) {
    return DropdownItem(
      text: text,
      iconData: iconData,
      isSelectd: isSelectd,
      isFirstItem: true,
    );
  }
  factory DropdownItem.last({
    required String text,
    required IconData iconData,
    bool isSelectd = false,
  }) {
    return DropdownItem(
      text: text,
      iconData: iconData,
      isSelectd: isSelectd,
      isLastItem: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: isFirstItem ? const Radius.circular(8) : Radius.zero,
          bottom: isLastItem ? const Radius.circular(8) : Radius.zero,
        ),
        color: isSelectd ? Colors.red.shade900 : Colors.red.shade600,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Text(
            text.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Icon(iconData, color: Colors.white),
        ],
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class ArrowShape extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    return path;
  }
}
