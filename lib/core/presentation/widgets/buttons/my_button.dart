import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final Widget child;
  final FutureOr<void> Function()? onPressed;
  final FutureOr<void> Function()? onLongPress;
  final EdgeInsets? padding;

  final Color? color;
  final Gradient? gradient;

  final BoxBorder? border;
  final BorderRadius? borderRadius;

  final Clip clipBehavior;
  final bool makeHalfTransparentIfDisabled;
  final List<BoxShadow>? boxShadow;

  const MyButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    required this.child,
    this.padding,
    this.color,
    this.gradient,
    this.borderRadius,
    this.border,
    this.makeHalfTransparentIfDisabled = true,
    this.clipBehavior = Clip.none,
    this.boxShadow,
  }) : assert(
          !(color != null && gradient != null),
          'color and gradient cannot be used together',
        );

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isPressed = false; // make a half transparent
  bool _isOnPressedCalling = false;

  bool get isDisabled => widget.onPressed == null && widget.onLongPress == null;

  void _handleTapDown() {
    if (!mounted || _isOnPressedCalling) return;
    setState(() => _isPressed = true);
  }

  void _handleTapUp() {
    if (!mounted && _isOnPressedCalling) return;
    setState(() => _isPressed = false);
  }

  void _handleTap() async {
    if (!mounted || _isOnPressedCalling) return;
    if (widget.onPressed is Future<void> Function()) {
      setState(() => _isPressed = true);
      _isOnPressedCalling = true;
      await widget.onPressed!();
      _isOnPressedCalling = false;
      if (!mounted) return;
      setState(() => _isPressed = false);
    } else {
      widget.onPressed!();
    }
  }

  void _handleLongPress() async {
    if (!mounted || _isOnPressedCalling) return;
    if (widget.onLongPress is Future<void> Function()) {
      setState(() => _isPressed = true);
      _isOnPressedCalling = true;
      await widget.onLongPress!();
      _isOnPressedCalling = false;
      if (!mounted) return;
      setState(() => _isPressed = false);
    } else {
      widget.onLongPress!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: isDisabled ? null : (_) => _handleTapUp(),
      onPointerCancel: isDisabled ? null : (_) => _handleTapUp(),
      onPointerDown: isDisabled ? null : (_) => _handleTapDown(),
      child: GestureDetector(
        onTap: widget.onPressed == null ? null : _handleTap,
        onLongPress: widget.onLongPress == null ? null : _handleLongPress,
        child: Opacity(
          opacity:
              (isDisabled && widget.makeHalfTransparentIfDisabled) || _isPressed
                  ? 0.5
                  : 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: widget.color ??
                  (widget.gradient == null ? Colors.transparent : null),
              gradient: widget.gradient,
              borderRadius: widget.borderRadius,
              border: widget.border,
              boxShadow: widget.boxShadow,
            ),
            clipBehavior: widget.clipBehavior,
            padding: widget.padding ?? EdgeInsets.zero,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
