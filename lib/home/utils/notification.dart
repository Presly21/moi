import 'package:flutter/material.dart';

void main() => runApp(NotificationIconApp());

class NotificationIconApp extends StatelessWidget {
  const NotificationIconApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const NotificationIconScreen(),
    );
  }
}

class NotificationIconScreen extends StatefulWidget {
  const NotificationIconScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationIconScreenState createState() => _NotificationIconScreenState();
}

class _NotificationIconScreenState extends State<NotificationIconScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin:const Offset(0.0, 0.0),
      end:const Offset(0.0, -0.2),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SlideTransition(
          position: _offsetAnimation,
          child: const Icon(
            Icons.notifications,
            size: 40,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
