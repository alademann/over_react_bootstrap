part of over_react_bootstrap.components;

/// List groups are a flexible and powerful component for displaying a series of content.
/// Modify and extend them to support just about any content within.
///
/// > See: <https://getbootstrap.com/docs/4.0/components/list-group/>
@Factory()
UiFactory<ListGroupProps> ListGroup = _$ListGroup;

@Props()
class _$ListGroupProps extends UiProps with BsSpacingProps {
  /// The HTML element type for the [ListGroup], specifying its DOM representation when rendered.
  ///
  /// If your list contains clickable [ListGroupItem]s, set this to [ListGroupElementType.DIV].
  ///
  /// > Default: [ListGroupElementType.UL]
  ListGroupElementType elementType;
}

@Component()
class ListGroupComponent extends UiComponent<ListGroupProps> with BsSpacingUtils<ListGroupProps> {
  @override
  Map getDefaultProps() => (newProps()
    ..elementType = ListGroupElementType.UL
  );

  @override
  render() {
    var classes = forwardingClassNameBuilder()
      ..add('list-group');

    return (props.elementType.componentBuilderFactory()
      ..addProps(copyUnconsumedDomProps())
      ..className = classes.toClassName()
    )(props.children);
  }
}

/// Options for the [Element] that will be used when rendering a [ListGroup] component.
class ListGroupElementType {
  final BuilderOnlyUiFactory<DomProps> componentBuilderFactory;
  ListGroupElementType._internal(this.componentBuilderFactory);

  /// A [Dom.ul] (HTML `<ul>` element)
  static final ListGroupElementType UL  = new ListGroupElementType._internal(Dom.ul);

  /// A [Dom.div] (HTML `<div>` element)
  static final ListGroupElementType DIV = new ListGroupElementType._internal(Dom.div);
}
