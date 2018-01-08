part of over_react.web.demos;

ReactElement badgeBasicDemo() => Dom.div()(
  Dom.h1()('Example heading ', (Badge()..skin = BadgeSkin.LIGHT)('New')),
  Dom.h2()('Example heading ', (Badge()..skin = BadgeSkin.LIGHT)('New')),
  Dom.h3()('Example heading ', (Badge()..skin = BadgeSkin.LIGHT)('New')),
  Dom.h4()('Example heading ', (Badge()..skin = BadgeSkin.LIGHT)('New')),
  Dom.h5()('Example heading ', (Badge()..skin = BadgeSkin.LIGHT)('New')),
  Dom.h6()('Example heading ', (Badge()..skin = BadgeSkin.LIGHT)('New'))
);
