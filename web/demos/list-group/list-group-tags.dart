part of over_react.web.demos;

ReactElement listGroupTagsDemo() =>
  ListGroup()(
    ListGroupItem()(
      (Badge()
        ..className = 'float-xs-right'
        ..isPill = true
      )(14),
      'Cras justo odio'
    ),
    ListGroupItem()(
      (Badge()
        ..className = 'float-xs-right'
        ..isPill = true
      )(2),
      'Dapibus ac facilisis in'
    ),
    ListGroupItem()(
      (Badge()
        ..className = 'float-xs-right'
        ..isPill = true
      )(1),
      'Morbi leo risus'
    )
  );
