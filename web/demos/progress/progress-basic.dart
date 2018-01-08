part of over_react.web.demos;

ReactElement progressBasicDemo() => Dom.div()(
  (ProgressBar()
    ..rootNodeProps = (domProps()..className = bsMarginBottom(BsSpacingSize.DEFAULT))
  )(),
  (ProgressBar()
    ..rootNodeProps = (domProps()..className = bsMarginBottom(BsSpacingSize.DEFAULT))
    ..value = 25.0
    ..showPercentComplete = true
  )(),
  (ProgressBar()
    ..rootNodeProps = (domProps()..className = bsMarginBottom(BsSpacingSize.DEFAULT))
    ..value = 50.0
    ..caption = 'Reticulating splines... '
    ..showPercentComplete = true
  )(),
  (ProgressBar()
    ..rootNodeProps = (domProps()..className = bsMarginBottom(BsSpacingSize.DEFAULT))
    ..value = 75.0
    ..caption = 'Reticulating splines... '
    ..showPercentComplete = true
  )(),
  (ProgressBar()
    ..rootNodeProps = (domProps()..className = bsMarginBottom(BsSpacingSize.DEFAULT))
    ..value = 100.0
    ..caption = 'Reticulating splines... '
    ..showPercentComplete = true
  )()
);
