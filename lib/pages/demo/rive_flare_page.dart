import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_one/common/PageRoot.dart';

class RiveFlarePage extends StatefulWidget {
  @override
  _RiveFlarePageState createState() => _RiveFlarePageState();
}

class _RiveFlarePageState extends State<RiveFlarePage> {
  String _currentAnimation = "day_idle";

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      title: "Rive/Flare",
      body: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        alignment: Alignment.center,
        color: _currentAnimation == "day_idle" || _currentAnimation == "switch_day" ? Colors.white : Colors.black,
        child: Container(
          height: 140,
          width: 230,
          child: GestureDetector(
            onTap: () => setState(() {
              if (_currentAnimation == "day_idle") {
                _currentAnimation = "switch_night";
              } else if (_currentAnimation == "night_idle") {
                _currentAnimation = "switch_day";
              }
            }),
            child: FlareActor(
              "assets/switch_daytime.flr",
              fit: BoxFit.contain,
              animation: _currentAnimation,
              callback: (name) {
                if (name == "switch_night") {
                  setState(() => _currentAnimation = "night_idle");
                } else if (name == "switch_day") {
                  setState(() => _currentAnimation = "day_idle");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
