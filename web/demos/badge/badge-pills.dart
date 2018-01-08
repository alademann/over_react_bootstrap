part of over_react.web.demos;

ReactElement badgePillsDemo() => Dom.div()(
  (Badge()
    ..isPill = true
    ..skin = BadgeSkin.PRIMARY
  )('Primary'),
  (Badge()
    ..isPill = true
    ..skin = BadgeSkin.SUCCESS
  )('Success'),
  (Badge()
    ..isPill = true
    ..skin = BadgeSkin.INFO
  )('Info'),
  (Badge()
    ..isPill = true
    ..skin = BadgeSkin.WARNING
  )('Warning'),
  (Badge()
    ..isPill = true
    ..skin = BadgeSkin.DANGER
  )('Danger'),
  (Badge()
    ..isPill = true
    ..skin = BadgeSkin.LIGHT
  )('Light'),
  (Badge()
    ..isPill = true
    ..skin = BadgeSkin.DARK
  )('Dark'),
);
