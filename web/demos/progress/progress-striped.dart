part of over_react.web.demos;

ReactElement progressStripedDemo() => Dom.div()(
  (ProgressBar()
    ..value = 10.0
    ..isStriped = true
  )(),
  (ProgressBar()
    ..value = 25.0
    ..skin = ProgressBarSkin.SUCCESS
    ..isStriped = true
  )(),
  (ProgressBar()
    ..value = 50.0
    ..skin = ProgressBarSkin.INFO
    ..isStriped = true
  )(),
  (ProgressBar()
    ..value = 75.0
    ..skin = ProgressBarSkin.WARNING
    ..isStriped = true
  )(),
  (ProgressBar()
    ..value = 100.0
    ..skin = ProgressBarSkin.DANGER
    ..isStriped = true
  )()
);
