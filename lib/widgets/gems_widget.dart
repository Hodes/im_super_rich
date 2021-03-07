import 'package:flutter/material.dart';

class GemsWidget extends StatefulWidget {
  @override
  _GemsWidgetState createState() => _GemsWidgetState();
}

class _GemsWidgetState extends State<GemsWidget>
    with SingleTickerProviderStateMixin {
  double _gemRotation = 0.0;
  Animation elasticAnimation;
  Animation<double> animatedRotation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    elasticAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut
    );
    animatedRotation = AlwaysStoppedAnimation(0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  rotateGem(double amount) {
    setState(() {
      animatedRotation = Tween(
          begin: this._gemRotation,
          end: this._gemRotation + amount,
      ).animate(elasticAnimation)
      ..addListener(() {
        setState(() {
          _gemRotation = animatedRotation.value;
        });
      });
      this._controller.reset();
      this._controller.forward();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(30),
            child: Transform.rotate(
              angle: animatedRotation.value,
              child: Image(
                image: AssetImage('assets/images/gems.png'),
              ),
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.lightGreen[800],
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => rotateGem(0.5),
        backgroundColor: Colors.green[400],
        tooltip: 'Rotate Gem',
        child: Icon(Icons.rotate_right),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
