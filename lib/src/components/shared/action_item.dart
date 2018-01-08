part of over_react_bootstrap.components;

/// Props that should be available on any "action" (clickable) component.
///
/// The component class that utilizes the props class that this gets mixed into should mix in the
/// [ActionItemUtils] class.
@PropsMixin()
abstract class ActionItemProps implements UiProps {
  @override
  Map get props;

  static final Map defaultProps = new Map.unmodifiable(
      new ActionItemPropsMapView({})
        ..isActive = false
        ..isDisabled = false
        ..type = ButtonType.BUTTON
  );

  /// Whether the item should appear "active" / "pressed".
  ///
  /// > Default: `false`
  bool isActive;

  /// Whether the item is disabled.
  ///
  /// > Default: `false`
  @Accessor(key: 'disabled', keyNamespace: '')
  bool isDisabled;

  /// The HTML `href` attribute value for the item.
  ///
  /// If set, the item will render via [Dom.a].
  ///
  /// _Proxies [DomProps.href]_
  @Accessor(keyNamespace: '')
  String href;

  /// The HTML `target` attribute value for the item.
  ///
  /// If set, the item will render via [Dom.a].
  ///
  /// _Proxies [DomProps.target]_
  @Accessor(keyNamespace: '')
  String target;

  /// The HTML `type` attribute value for the item when rendered via [Dom.button].
  ///
  /// This will only be applied if [href] is not set.
  ///
  /// _Proxies [DomProps.type]_
  ///
  /// > Default: [ButtonType.BUTTON]
  ButtonType type;
}

class ActionItemPropsMapView extends UiPropsMapView with ActionItemProps {
  /// Create a new instance backed by a specific map.
  ActionItemPropsMapView(Map map) : super(map);
}

abstract class ActionItemUtils<T extends ActionItemProps> {
  T get props;

  ClassNameBuilder getActionItemClasses() => new ClassNameBuilder()
    ..add('active', _isActive)
    ..add('disabled', _isAnchorLink && props.isDisabled);

  Map getActionItemProps() => domProps()
    ..href = props.href
    ..target = _isAnchorLink ? props.target : null
    ..type = _type
    ..disabled = _useDisabledAttr ? _disabled : null
    ..aria.disabled = _useDisabledAttr ? null : _disabled
    ..aria.pressed = _isActive ? true : null;

  bool get _isActionItem => (props.href ?? props.onClick) != null;

  bool get _isAnchorLink => props.href != null;

  bool get _useDisabledAttr => _isActionItem && !_isAnchorLink;

  bool get _isActive => props.isActive;

  bool get _disabled => !_isActionItem
      ? null
      : props.isDisabled;

  String get _type => (!_isActionItem || _isAnchorLink)
      ? null
      : props.type.typeName;

  BuilderOnlyUiFactory<DomProps> get _actionItemDomNodeFactory => _isAnchorLink
      ? Dom.a
      : Dom.button;
}
