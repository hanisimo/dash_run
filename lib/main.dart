import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'engine/game_widget.dart';

void main() {
  // Binding to be initialized before calling runApp.
  WidgetsFlutterBinding.ensureInitialized();

  // Set the preferred orientation to portraitUp
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Run COVID-19 Fighter Game
  runApp(COVID19FighterGame());
}

// the App level UI widget
class COVID19FighterGame extends StatelessWidget {
  // This widget is the game root.
  final GameWidget gameWidget = GameWidget();

  @override
  Widget build(BuildContext buildContext) => MediaQuery(
        data: MediaQueryData.fromWindow(ui.window),
        child: Container(
          color: Colors.cyan[400],
          child: SafeArea(
            child: GestureDetector(
                onTap: () => gameWidget.tapHandler(),
                onHorizontalDragUpdate: (DragUpdateDetails dragUpdateDetails) =>
                    gameWidget
                        .swipeHandler(dragUpdateDetails.globalPosition.dx),
                behavior: HitTestBehavior.translucent,
                child: gameWidget),
          ),
        ),
      );
}
