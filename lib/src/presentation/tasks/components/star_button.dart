import 'package:flutter/material.dart';
import 'package:godo/core/utils/type_defs.dart';

class StarButton extends StatefulWidget {
  const StarButton({super.key, this.initialState = false, required this.onTapped});

  final bool initialState;
  final StarPressed onTapped;

  @override
  State<StarButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  bool _isStarred = false;

  @override
  void initState() {
    _isStarred = widget.initialState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() => _isStarred = !_isStarred);
          widget.onTapped(_isStarred);
        },
        icon: Icon(_isStarred ? Icons.star_rounded : Icons.star_border_rounded));
  }
}
