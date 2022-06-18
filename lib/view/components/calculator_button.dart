import 'package:calculatorapp/util/constants.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    required this.text,
    required this.color,
    required this.onTap,
    this.textColor,
    Key? key,
  }) : super(key: key);
  final String text;
  final Color color;
  final Function onTap;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        padding: const EdgeInsets.all(4),
        child: Center(
          child: Text(
            text,
            style: Constants.calculatorStyle.copyWith(
                color: textColor ?? Colors.black,
                fontSize: Constants.isMobile ? 18 : 28),
          ),
        ),
      ),
    );
  }
}
