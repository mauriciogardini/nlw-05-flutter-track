import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatefulWidget {
  final String label;
  final Color color;
  final Color fontColor;
  final Color borderColor;
  final bool isPressed;

  const LevelButtonWidget({
    Key? key,
    required this.label,
    required this.color,
    required this.fontColor,
    required this.borderColor,
    this.isPressed = false,
  }) : super(key: key);

  factory LevelButtonWidget.fromMap(Map<String, dynamic> map) {
    return LevelButtonWidget(
      label: map['label'],
      color: map['color'],
      fontColor: map['fontColor'],
      borderColor: map['borderColor'],
    );
  }

  @override
  _LevelButtonWidgetState createState() => _LevelButtonWidgetState();
}

class _LevelButtonWidgetState extends State<LevelButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 4) - 12,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 6,
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.notoSans(
              color: widget.fontColor,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

class LevelButtonsWidget extends StatefulWidget {
  @override
  _LevelButtonsWidgetState createState() => _LevelButtonsWidgetState();
}

class _LevelButtonsWidgetState extends State<LevelButtonsWidget> {
  final homeController = HomeController.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ToggleButtons(
        children: homeController.filters
            .map((x) => LevelButtonWidget.fromMap(x))
            .toList(),
        isSelected: homeController.filterStatuses,
        onPressed: (int index) {
          setState(() {
            homeController.filterStatuses[index] =
                !homeController.filterStatuses[index];
          });
        },
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
