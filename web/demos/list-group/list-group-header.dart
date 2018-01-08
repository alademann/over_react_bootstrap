part of over_react.web.demos;

ReactElement listGroupHeaderDemo() =>
  ListGroup()(
    (ListGroupItem()
      ..onClick = (_) {}
      ..isActive = true
    )(
      Dom.h5()('List group item heading'),
      Dom.p()(
        'Donec id elit non mi porta gravida at eget metus. '
        'Maecenas sed diam eget risus varius blandit.'
      )
    ),
    (ListGroupItem()
      ..onClick = (_) {}
    )(
      Dom.h5()('List group item heading'),
      Dom.p()(
        'Donec id elit non mi porta gravida at eget metus. '
        'Maecenas sed diam eget risus varius blandit.'
      )
    ),
    (ListGroupItem()
      ..onClick = (_) {}
    )(
      Dom.h5()('List group item heading'),
      Dom.p()(
        'Donec id elit non mi porta gravida at eget metus. '
        'Maecenas sed diam eget risus varius blandit.'
      )
    )
  );
