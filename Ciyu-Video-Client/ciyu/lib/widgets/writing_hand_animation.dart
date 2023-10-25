import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WritingHandAnimation extends StatefulWidget {
  @override
  _WritingHandAnimationState createState() => _WritingHandAnimationState();
}

class _WritingHandAnimationState extends State<WritingHandAnimation>
    with TickerProviderStateMixin {
  late AnimationController _positionController;
  late Animation<Offset> _positionAnimation;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _positionController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _positionAnimation = Tween<Offset>(
      begin: Offset(0, 0.0),
      end: Offset(0.4, 0.0),
    ).animate(
        CurvedAnimation(parent: _positionController, curve: Curves.easeInOut));

    _positionController.repeat(reverse: true);

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.6,
      end: 0.5,
    ).animate(
        CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut));

    _scaleController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _positionController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _positionAnimation,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Transform.translate(
            offset: Offset(-4.0, 4.0),
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
          Icon(
            FontAwesomeIcons.pen,
            size: 12,
            color: Colors.black,
          ),
          Transform.translate(
            offset: Offset(12, -8),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              child: Text(
                "AI",
                style: TextStyle(
                  fontFamily: '',
                  color: Colors.white,
                  fontSize: 6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
