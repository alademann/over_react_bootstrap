part of over_react.web.demos;

ReactElement progressContextualDemo() => Dom.div()(
  (ProgressBar()
    ..value = 25.0
    ..skin = ProgressBarSkin.SUCCESS
  )(),
  (ProgressBar()
    ..value = 50.0
    ..skin = ProgressBarSkin.INFO
  )(),
  (ProgressBar()
    ..value = 75.0
    ..skin = ProgressBarSkin.WARNING
  )(),
  (ProgressBar()
    ..value = 100.0
    ..skin = ProgressBarSkin.DANGER
  )()
);
