import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Glass extends StatelessWidget {
  Widget display;
  Glass(this.display, {super.key});
  @override
  Widget build(BuildContext context) {
    return  GlassmorphicFlexContainer(
                borderRadius: 30,
                blur: 0,
                padding: const EdgeInsets.all(0),
                alignment: Alignment.bottomCenter,
                border: 1,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.1),
                      const Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                    stops: const [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.5),
                    const Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                child:display,
              );
  }
}