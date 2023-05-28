import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final double radius;
  final double width;
  final Widget? icon;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final bool loading;
  final Color borderColor;
  final Color? iconColor;
   TextStyle? textStyle;
  final TextTheme primaryTextTheme;

  CustomButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.radius = 30.0,
      this.width = 343.0,
      this.icon,
      this.textStyle,
      required this.backgroundColor,
      required this.borderColor,
      this.textColor = Colors.white,
      this.iconColor,
      this.height = 54.0,
      this.loading = false,
      required this.primaryTextTheme})
      : super(key: key) {
        textStyle ??= primaryTextTheme.displaySmall!;
    
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      clipBehavior: Clip.hardEdge,
      onPressed: loading ? null : onPressed,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          minimumSize: MaterialStateProperty.all(Size(width, height)),
          maximumSize: MaterialStateProperty.all(Size(width, height)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                  side: BorderSide(
                      color: loading || onPressed == null
                          ? Theme.of(context).disabledColor
                          : borderColor))),
          shadowColor: MaterialStateProperty.all(
            const Color(0xff4d4d4d).withOpacity(0.2),
          ),
          backgroundColor: MaterialStateProperty.all(
              loading || onPressed == null
                  ?Theme.of(context).disabledColor
                  : backgroundColor)),
      child: loading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                  icon!
                    ,
                  if (icon != null)
                    const SizedBox(
                      width: 12,
                    ),
                  Text(label,
                      style: textStyle!
                          .copyWith(color: textColor)),
                ],
              ),
            ),
    );
  }
}
