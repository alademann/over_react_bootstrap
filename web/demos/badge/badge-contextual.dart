part of over_react.web.demos;

ReactElement badgeContextualDemo() => Dom.div()(
  (Badge()..skin = BadgeSkin.PRIMARY)('Primary'),
  (Badge()..skin = BadgeSkin.SUCCESS)('Success'),
  (Badge()..skin = BadgeSkin.INFO)('Info'),
  (Badge()..skin = BadgeSkin.WARNING)('Warning'),
  (Badge()..skin = BadgeSkin.DANGER)('Danger'),
  (Badge()..skin = BadgeSkin.DANGER)('Light'),
  (Badge()..skin = BadgeSkin.DANGER)('Dark'),
);
