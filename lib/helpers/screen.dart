import 'dart:ui';

import 'package:flutter/material.dart';

class ScreenData {
  final BuildContext _context;

  static late Size _screenSize;

  static late Orientation _screenOrientation;

  ScreenData(this._context) {
    _screenSize = View.maybeOf(_context)!.physicalSize;
    _screenOrientation = MediaQuery.of(_context).orientation;

    print('Screen Size init: $_screenSize');
    print('Screen Orientation init: $_screenOrientation');
  }

  Size get screenSize => _screenSize;
  Orientation get screenOrientation => _screenOrientation;
}
