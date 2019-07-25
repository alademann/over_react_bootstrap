part of over_react_bootstrap.components;

/// Bootstrap's `Badge` component renders a small and adaptive badge
/// for adding context to just about any content.
///
/// > See: <https://getbootstrap.com/docs/4.0/components/badge/>
@Factory()
UiFactory<BadgeProps> Badge = _$Badge;

@Props()
class _$BadgeProps extends UiProps with ActionItemProps {
  /// The skin / "context" for the [Badge].
  ///
  /// __Required.__
  ///
  /// > See: <https://getbootstrap.com/docs/4.0/components/badge/#contextual-variations>.
  @requiredProp
  BadgeSkin skin;

  /// Whether to render the [Badge] with rounded corners that make it look
  /// more like a "pill" (a.k.a Bootstrap v3 "badge")
  ///
  /// > See: <https://getbootstrap.com/docs/4.0/components/badge/#pill-badges>.
  ///
  /// > Default: `false`
  bool isPill;
}

@Component()
class BadgeComponent<T extends BadgeProps> extends UiComponent<T> with ActionItemUtils<T> {
  @override
  Map getDefaultProps() => (newProps()
    ..addProps(ActionItemProps.defaultProps)
    ..isPill = false
  );

  @override
  render() {
    var classes = forwardingClassNameBuilder()
      ..add(getActionItemClasses().toClassName())
      ..add('badge')
      ..add('badge-pill', props.isPill)
      ..add(props.skin.className);

    return (_badgeDomNodeFactory()
      ..addProps(copyUnconsumedDomProps())
      ..addProps(getActionItemProps())
      ..className = classes.toClassName()
    )(props.children);
  }

  BuilderOnlyUiFactory<DomProps> get _badgeDomNodeFactory => _isActionItem
      ? _actionItemDomNodeFactory
      : Dom.span;

  @override
  bool get _isActionItem => _isAnchorLink;
}

/// Contextual skin options for a [Badge] component.
class BadgeSkin extends ClassNameConstant {
  const BadgeSkin._(String name, String className) : super(name, className);

  static const BadgeSkin PRIMARY = const BadgeSkin._('PRIMARY', 'badge-primary');
  static const BadgeSkin DANGER = const BadgeSkin._('DANGER', 'badge-danger');
  static const BadgeSkin SUCCESS = const BadgeSkin._('SUCCESS', 'badge-success');
  static const BadgeSkin WARNING = const BadgeSkin._('WARNING', 'badge-warning');
  static const BadgeSkin INFO = const BadgeSkin._('INFO', 'badge-info');
  static const BadgeSkin LIGHT = const BadgeSkin._('LIGHT', 'badge-light');
  static const BadgeSkin DARK = const BadgeSkin._('DARK', 'badge-dark');
}
