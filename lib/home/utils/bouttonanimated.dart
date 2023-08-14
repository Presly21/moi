import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin:const Offset(0.0, 0.0),
      end:const Offset(0.0, 0.2),
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Bouton animé'),
      ),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: ElevatedButton(
            onPressed: () {
              if (_animationController.isCompleted) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
            },
            child: const Text('Appuyez-moi'),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AnimatedButton(),
  ));
}
