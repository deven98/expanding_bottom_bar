import 'expanding_bottom_display_item.dart';
import 'expanding_bottom_bar_item.dart';
import 'package:flutter/material.dart';

/// Main BottomNavigationBar class
class ExpandingBottomBar extends StatefulWidget {
  /// Height of the navigation bar item
  final double navBarHeight;

  /// Items in the BottomNavigationBar
  final List<ExpandingBottomBarItem> items;

  /// Duration of the selection animation
  final Duration animationDuration;

  /// The selected index of the bar
  final int selectedIndex;

  /// Callback when an item is selected
  final ValueChanged<int> onIndexChanged;

  /// The background color of the BottomNavigationBar
  final Color backgroundColor;

  ExpandingBottomBar({
    this.navBarHeight = 100.0,
    required this.items,
    this.animationDuration = const Duration(milliseconds: 200),
    required this.selectedIndex,
    required this.onIndexChanged,
    this.backgroundColor = Colors.white,
  }) : assert(items.length >= 2);

  @override
  _ExpandingBottomBarState createState() => _ExpandingBottomBarState();
}

class _ExpandingBottomBarState extends State<ExpandingBottomBar>
    with TickerProviderStateMixin {
  /// Hosts all the controllers controlling the boxes.
  List<AnimationController> _controllers = [];

  /// The current chosen index
  int indexChosen = 0;

  @override
  void initState() {
    super.initState();
    // Initialise all animation controllers.
    for (int i = 0; i < widget.items.length; i++) {
      _controllers.add(
        AnimationController(
          vsync: this,
          duration: widget.animationDuration,
        ),
      );
    }
    // Start animation for initially selected controller.
    _controllers[widget.selectedIndex].forward();
  }

  @override
  Widget build(BuildContext context) {
    _changeValue();
    return Container(
      height: widget.navBarHeight,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.items.map((item) {
              int index = widget.items.indexOf(item);
              return ExpandingDisplayItem(
                item.text,
                item.icon,
                widget.navBarHeight,
                _controllers[index],
                () {
                  widget.onIndexChanged(index);
                },
                item.selectedColor,
                item.heightBoxICon,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _changeValue() {
    _controllers.forEach((controller) => controller.reverse());
    _controllers[widget.selectedIndex].forward();
  }
}
