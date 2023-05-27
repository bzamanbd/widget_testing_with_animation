import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.green;
  double _radius = 0;

  void _onTap() {
    setState(() {
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _color = _color == Colors.green ? Colors.red : Colors.green;
      _radius = _radius == 0 ? 50 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
          child: InkWell(
        key: const Key('myBtn'),
        onTap: _onTap,
        child: AnimatedContainer(
          key: const Key('aniCont'),
          duration: const Duration(seconds: 1),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
              color: _color, borderRadius: BorderRadius.circular(_radius)),
        ),
      )),
    );
  }
}
