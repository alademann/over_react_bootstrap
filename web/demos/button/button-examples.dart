part of over_react.web.demos;

ReactElement buttonExamplesDemo() =>
  (Dom.div()..className = 'btn-toolbar')(
    Button()('Primary'),
    nonBreakingSpace,
    (Button()..skin = ButtonSkin.SECONDARY)('Secondary'),
    nonBreakingSpace,
    (Button()..skin = ButtonSkin.SUCCESS)('Success'),
    nonBreakingSpace,
    (Button()..skin = ButtonSkin.DANGER)('Danger'),
    nonBreakingSpace,
    (Button()..skin = ButtonSkin.WARNING)('Warning'),
    nonBreakingSpace,
    (Button()..skin = ButtonSkin.INFO)('Info'),
    nonBreakingSpace,
    (Button()..skin = ButtonSkin.LIGHT)('Light'),
    nonBreakingSpace,
    (Button()..skin = ButtonSkin.DARK)('Dark '),
    nonBreakingSpace,
    (Button()
      ..href = '#'
      ..skin = ButtonSkin.LINK
    )('Link')
  );
