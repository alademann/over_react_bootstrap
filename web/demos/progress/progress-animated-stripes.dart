part of over_react.web.demos;

ReactElement progressAnimatedStripesDemo() =>
  (ProgressBar()
    ..value = 25.0
    ..isStriped = true
    ..isAnimated = true
  )();
