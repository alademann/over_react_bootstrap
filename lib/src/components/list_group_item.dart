part of over_react_bootstrap.components;

/// Nest one or more `ListGroupItem` components within a [ListGroup]
/// to render individual items within a list.
///
/// > See: <https://getbootstrap.com/docs/4.0/components/list-group/>
@Factory()
UiFactory<ListGroupItemProps> ListGroupItem;

@Props()
class ListGroupItemProps extends UiProps with ActionItemProps {
  /// The HTML element type for the [ListGroupItem], specifying its DOM representation when rendered.
  ///
  /// Will only be used if [href] and [onClick] are both `null`.
  ///
  /// Default: [ListGroupItemElementType.LI]
  ListGroupItemElementType elementType;

  /// The skin / "context" for the [ListGroupItem].
  ///
  /// > See: <https://getbootstrap.com/docs/4.0/components/list-group/#contextual-classes>.
  ///
  /// > Default: [ListGroupItemSkin.DEFAULT]
  ListGroupItemSkin skin;
}

@Component()
class ListGroupItemComponent extends UiComponent<ListGroupItemProps> with ActionItemUtils<ListGroupItemProps> {
  @override
  Map getDefaultProps() => (newProps()
    ..addProps(ActionItemProps.defaultProps)
    ..elementType = ListGroupItemElementType.LI
    ..skin = ListGroupItemSkin.DEFAULT
  );

  @override
  render() {
    return (_itemDomNodeFactory()
      ..addProps(copyUnconsumedDomProps())
      ..addProps(getActionItemProps())
      ..className = _getItemClasses().toClassName()
    )(props.children);
  }

  BuilderOnlyUiFactory<DomProps> get _itemDomNodeFactory => _isActionItem
      ? _actionItemDomNodeFactory
      : props.elementType.componentBuilderFactory;

  ClassNameBuilder _getItemClasses() {
    return forwardingClassNameBuilder()
      ..add(getActionItemClasses().toClassName())
      ..add('list-group-item')
      ..add('list-group-item-action', _isActionItem)
      ..add(props.skin.className);
  }
}

/// Contextual skin options for a [ListGroupItem] component.
class ListGroupItemSkin extends ClassNameConstant {
  const ListGroupItemSkin._(String name, String className) : super(name, className);

  /// [className] value: null
  static const ListGroupItemSkin DEFAULT =
      const ListGroupItemSkin._('DEFAULT', null);

  /// [className] value: 'list-group-item-danger'
  static const ListGroupItemSkin DANGER =
      const ListGroupItemSkin._('DANGER', 'list-group-item-danger');

  /// [className] value: 'list-group-item-success'
  static const ListGroupItemSkin SUCCESS =
      const ListGroupItemSkin._('SUCCESS', 'list-group-item-success');

  /// [className] value: 'list-group-item-warning'
  static const ListGroupItemSkin WARNING =
      const ListGroupItemSkin._('WARNING', 'list-group-item-warning');

  /// [className] value: 'list-group-item-info'
  static const ListGroupItemSkin INFO =
      const ListGroupItemSkin._('INFO', 'list-group-item-info');
}

/// Options for the [Element] that will be used when rendering a [ListGroupItem] component.
class ListGroupItemElementType {
  final BuilderOnlyUiFactory<DomProps> componentBuilderFactory;
  ListGroupItemElementType._internal(this.componentBuilderFactory);

  /// A [Dom.li] (HTML `<li>` element)
  ///
  /// Will only be used if [ListGroupItemProps.href] and
  /// [ListGroupItemProps.onClick] are both `null`.
  ///
  /// Only use this when the parent [ListGroup] has
  /// [ListGroupProps.elementType] set to [ListGroupElementType.UL].
  static final ListGroupItemElementType LI =
      new ListGroupItemElementType._internal(Dom.li);

  /// A [Dom.span] (HTML `<span>` element)
  ///
  /// Will only be used if [ListGroupItemProps.href] and
  /// [ListGroupItemProps.onClick] are both `null`.
  static final ListGroupItemElementType SPAN =
      new ListGroupItemElementType._internal(Dom.span);
}
