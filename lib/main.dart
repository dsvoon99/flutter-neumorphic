import 'package:flutter/material.dart';

void main() => runApp(NeumorphicApp());

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}

class NeumorphicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphic App',
      theme: ThemeData(
        backgroundColor: Colors.blueGrey.shade200,
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: Center(
          child: NeumorphicContainer(
            child: Text('Neumorphic'),
            bevel: 20.0,
          ),
        ),
      ),
    );
  }
}

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;

  NeumorphicContainer({
    this.child,
    this.bevel = 2.0,
    this.color,
  }) : this.blurOffset = Offset(bevel / 2, bevel / 2);
  @override
  _State createState() => _State();
}

class _State extends State<NeumorphicContainer> {

  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).backgroundColor;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.mix(Colors.black, .1),
                color,
                color,
                color.mix(Colors.white, .5),
              ],
              stops: [
                0.0,
                .2,
                .5,
                1.0,
              ]),
          borderRadius: BorderRadius.circular(widget.bevel),
          color: Colors.grey.shade200,
          boxShadow: _isPressed ? null : [
            BoxShadow(
              blurRadius: widget.bevel,
              offset: -widget.blurOffset,
              color: color.mix(Colors.white, 0.6),
            ),
            BoxShadow(
              blurRadius: widget.bevel,
              offset: widget.blurOffset,
              color: color.mix(Colors.black, 0.3),
            )
          ]),
      child: Listener(child: widget.child, onPointerDown: _onPointerDown, onPointerUp: _onPointerUp,),
    );
  }
}
