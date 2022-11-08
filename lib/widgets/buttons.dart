import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewBackButton extends StatelessWidget {

  const NewBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(CupertinoIcons.arrow_turn_up_left),
      color: Theme.of(context).colorScheme.onBackground,
      onPressed: () => Navigator.of(context).pop(),
    );
  }
  
}

class PrimaryButton extends StatefulWidget {

  PrimaryButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.onLongPress,
    this.feedback = true,
    this.disabled = false,
    this.padding,
    this.textStyle
  }) : super(key: key);

  final Widget child;
  final Function()? onPressed;
  final Function()? onLongPress;
  final bool feedback;
  final bool disabled;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: widget.padding,
        textStyle: widget.textStyle,
      ),
      child: widget.child,
      onPressed: widget.onPressed,
      onLongPress: widget.onLongPress,
    );
  }

}

class SecondaryButton extends StatefulWidget {

  SecondaryButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.onLongPress,
    this.feedback = true,
    this.disabled = false,
    this.isLoading = false,
    this.padding,
    this.textStyle
  }) : super(key: key);

  final Widget child;
  final Function()? onPressed;
  final Function()? onLongPress;
  final bool feedback;
  final bool disabled;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        padding: widget.padding,
        textStyle: widget.textStyle,
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }

}