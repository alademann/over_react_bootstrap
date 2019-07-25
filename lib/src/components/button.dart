part of over_react_bootstrap.components;

/// Use Bootstrap’s [Button] components for actions in forms, dialogs, and more with support
/// for multiple [ButtonProps.size]s, [ButtonProps.skin]s, and more.
///
/// > See: <https://getbootstrap.com/docs/4.0/components/buttons/>
@Factory()
UiFactory<ButtonProps> Button = _$Button;

@Props()
class _$ButtonProps extends UiProps with ActionItemProps, BsSpacingProps {
  /// The skin / "context" for the [Button].
  ///
  /// > See: <https://getbootstrap.com/docs/4.0/components/buttons/#examples>.
  ///
  /// > Default: [ButtonSkin.PRIMARY]
  ButtonSkin skin;

  /// The size of the [Button].
  ///
  /// > See: <https://getbootstrap.com/docs/4.0/components/buttons/#sizes>.
  ///
  /// > Default: [ButtonSize.DEFAULT]
  ButtonSize size;

  /// Whether the [Button] is a block level button -- that which spans the full width of its parent.
  ///
  /// > Default: `false`
  bool isBlock;
}

@State()
class _$ButtonState extends UiState {}

@Component()
class ButtonComponent<T extends ButtonProps, S extends ButtonState>
    extends UiStatefulComponent<T, S>
    with BsSpacingUtils<T>, ActionItemUtils<T> {
  @override
  Map getDefaultProps() => (newProps()
    ..addProps(ActionItemProps.defaultProps)
    ..skin = ButtonSkin.PRIMARY
    ..size = ButtonSize.DEFAULT
    ..isBlock = false
  );

  @override
  render() => renderButton();

  ReactElement renderButton([dynamic children]) {
    children ??= props.children;

    return (_actionItemDomNodeFactory()
      ..addProps(copyUnconsumedDomProps())
      ..addProps(getActionItemProps())
      ..className = getButtonClasses().toClassName()
    )(children);
  }

  ClassNameBuilder getButtonClasses() {
    return forwardingClassNameBuilder()
      ..add(getActionItemClasses().toClassName())
      ..add('btn')
      ..add('btn-block', props.isBlock)
      ..add(props.skin.className)
      ..add(props.size.className);
  }

  @override
  bool get _isActionItem => true;
}

/// A class of possible HTML `type` attribute values to be placed on a [Dom.button].
class ButtonType extends DebugFriendlyConstant {
  /// The DOM `<button>` `type` attribute value associated with this constant.
  final String typeName;

  const ButtonType._(String name, this.typeName) : super(name);

  /// [typeName] value: 'button'
  static const ButtonType BUTTON = const ButtonType._('BUTTON', 'button');

  /// [typeName] value: 'submit'
  static const ButtonType SUBMIT = const ButtonType._('SUBMIT', 'submit');

  /// [typeName] value: 'reset'
  static const ButtonType RESET  = const ButtonType._('RESET', 'reset');

  @override
  String get debugDescription => 'typeName: $typeName';
}

/// Contextual skin options for a [Button] component.
class ButtonSkin extends ClassNameConstant {
  const ButtonSkin._(String name, String className) : super(name, className);

  /// [className] value: 'btn-primary'
  static const ButtonSkin PRIMARY = const ButtonSkin._('PRIMARY', 'btn-primary');

  /// [className] value: 'btn-secondary'
  static const ButtonSkin SECONDARY = const ButtonSkin._('SECONDARY', 'btn-secondary');

  /// [className] value: 'btn-danger'
  static const ButtonSkin DANGER = const ButtonSkin._('DANGER', 'btn-danger');

  /// [className] value: 'btn-success'
  static const ButtonSkin SUCCESS = const ButtonSkin._('SUCCESS', 'btn-success');

  /// [className] value: 'btn-warning'
  static const ButtonSkin WARNING = const ButtonSkin._('WARNING', 'btn-warning');

  /// [className] value: 'btn-info'
  static const ButtonSkin INFO = const ButtonSkin._('INFO', 'btn-info');

  /// [className] value: 'btn-link'
  static const ButtonSkin LINK = const ButtonSkin._('LINK', 'btn-link');

  /// [className] value: 'btn-light'
  static const ButtonSkin LIGHT = const ButtonSkin._('LIGHT', 'btn-light');

  /// [className] value: 'btn-dark'
  static const ButtonSkin DARK = const ButtonSkin._('DARK', 'btn-dark');

  /// [className] value: 'btn-outline-primary'
  static const ButtonSkin PRIMARY_OUTLINE = const ButtonSkin._('PRIMARY_OUTLINE', 'btn-outline-primary');

  /// [className] value: 'btn-outline-secondary'
  static const ButtonSkin SECONDARY_OUTLINE = const ButtonSkin._('SECONDARY_OUTLINE', 'btn-outline-secondary');

  /// [className] value: 'btn-outline-danger'
  static const ButtonSkin DANGER_OUTLINE = const ButtonSkin._('DANGER_OUTLINE', 'btn-outline-danger');

  /// [className] value: 'btn-outline-success'
  static const ButtonSkin SUCCESS_OUTLINE = const ButtonSkin._('SUCCESS_OUTLINE', 'btn-outline-success');

  /// [className] value: 'btn-outline-warning'
  static const ButtonSkin WARNING_OUTLINE = const ButtonSkin._('WARNING_OUTLINE', 'btn-outline-warning');

  /// [className] value: 'btn-outline-info'
  static const ButtonSkin INFO_OUTLINE = const ButtonSkin._('INFO_OUTLINE', 'btn-outline-info');

  /// [className] value: 'btn-outline-light'
  static const ButtonSkin LIGHT_OUTLINE = const ButtonSkin._('LIGHT_OUTLINE', 'btn-outline-light');

  /// [className] value: 'btn-outline-dark'
  static const ButtonSkin DARK_OUTLINE = const ButtonSkin._('DARK_OUTLINE', 'btn-outline-dark');
}

/// Size options for a [Button] component.
class ButtonSize extends ClassNameConstant {
  const ButtonSize._(String name, String className) : super(name, className);

  /// [className] value: ''
  static const ButtonSize DEFAULT =
      const ButtonSize._('DEFAULT', '');

  /// [className] value: 'btn-lg'
  static const ButtonSize LARGE =
      const ButtonSize._('LARGE', 'btn-lg');

  /// [className] value: 'btn-sm'
  static const ButtonSize SMALL =
      const ButtonSize._('SMALL', 'btn-sm');
}
