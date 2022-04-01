import 'package:flutter/material.dart';

class ExpandingDisplayItem extends StatefulWidget {
  /// The title of the item in the BottomNavigationBar
  final String title;

  /// The icon in the item of the BottomNavigationBar
  final IconData icon;

  /// The height of the box (Carries the BottomNavigationBar height).
  final double height;

  /// The animation controller to control the flip animation.
  final AnimationController controller;

  /// Callback for when the box is selected (Not when the box is reversed).
  final VoidCallback onTapped;

  /// The color of the icon and background when selected
  final Color color;

  ExpandingDisplayItem(
    this.title,
    this.icon,
    this.height,
    this.controller,
    this.onTapped,
    this.color,
  );

  @override
  _ExpandingDisplayItemState createState() => _ExpandingDisplayItemState();
}

class _ExpandingDisplayItemState extends State<ExpandingDisplayItem>
    with TickerProviderStateMixin {
  /// Tween for going from 0 to pi/2 radian and vice versa.
  late Animation animation;

  /// Controller for controlling the Box.
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_null_comparison
    if (widget.controller == null) {
      controller = AnimationController(
          vsync: this, duration: Duration(milliseconds: 200));
    } else {
      controller = widget.controller;
    }
    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTapped();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(
            widget.color.red,
            widget.color.green,
            widget.color.blue,
            animation.value / 2.5,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                widget.icon,
                color: widget.color,
                size: widget.height / 3.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: animation.value != 0.0
                  ? Text(
                      widget.title,
                      style: TextStyle(
                        color: widget.color,
                        fontSize: (widget.height / 7) * animation.value,
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
