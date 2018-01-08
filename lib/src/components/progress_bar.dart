part of over_react_bootstrap.components;

/// Bootstrap's `Progress` component stylizes the HTML5 `<progress>` element with a
/// few extra CSS classes and some crafty browser-specific CSS.
///
/// > See: <https://getbootstrap.com/docs/4.0/components/progress/>
@Factory()
UiFactory<ProgressBarProps> ProgressBar;

@Props()
class ProgressBarProps extends UiProps {
  /// Sets a CSS `height` value on the root `.progress` node.
  ///
  /// The `.progress-bar` element's height will automatically grow / shrink to the height of the parent.
  dynamic height;

  /// The caption to display within the `.progress-bar` element.
  ///
  /// > Will be prepended with the % complete value if [showPercentComplete] is true.
  String caption;

  /// The current value of the [ProgressBar] component.
  ///
  /// This value should be between the [min] and [max] values.
  ///
  /// Default: `0.0`
  double value;

  /// The min value of the [ProgressBar] component.
  ///
  /// Default: `0.0`
  double min;

  /// The max value of the [ProgressBar] component.
  ///
  /// Default: `100.0`
  double max;

  /// The skin / "context" for the [ProgressBar] component.
  ///
  /// > See: <https://getbootstrap.com/docs/4.0/components/progress/#contextual-alternatives>.
  ///
  /// > Default: [ProgressBarSkin.DEFAULT]
  ProgressBarSkin skin;

  /// Whether to render a "Barber Pole" gradient stripe effect in the [ProgressBar] component.
  ///
  /// > Default: `false`
  bool isStriped;

  /// Whether to animate the "Barber Pole" gradient stripe effect in the [ProgressBar] component.
  ///
  /// __Note:__ Has no effect if [isStriped] is `false`.
  ///
  /// > Default: `false`
  bool isAnimated;

  /// Whether the % complete should be shown within the progress bar.
  ///
  /// If `true`, the value of [children] will be appended to the `.progress` element,
  /// otherwise, [children] will be placed within the `.progress-bar`.
  ///
  /// > Default: `false`
  bool showPercentComplete;

  /// Additional props to be added to the [Dom.div] that wraps around the `.progress-bar` element.
  ///
  /// __Do not set `style.height` here - use [height] instead.__
  Map rootNodeProps;
}

@Component()
class ProgressBarComponent extends UiComponent<ProgressBarProps> {
  @override
  Map getDefaultProps() => (newProps()
    ..value = 0.0
    ..min = 0.0
    ..max = 100.0
    ..skin = ProgressBarSkin.DEFAULT
    ..isStriped = false
    ..isAnimated = false
    ..showPercentComplete = false
  );

  @override
  render() {
    final rootNodeStyles = newStyleFromProps(props.rootNodeProps)
      ..['height'] = props.height;

    final rootNodeClasses = new ClassNameBuilder.fromProps(props.rootNodeProps)
      ..add('progress');

    return (Dom.div()
      ..addProps(props.rootNodeProps)
      ..className = rootNodeClasses.toClassName()
      ..style = rootNodeStyles
    )(
      renderProgressBar(),
      props.children,
    );
  }

  ReactElement renderProgressBar() {
    final progressBarStyles = newStyleFromProps(props)
      ..['width'] = '${getPercentComplete()}%';

    final progressBarClasses = forwardingClassNameBuilder()
      ..add('progress-bar')
      ..add('progress-bar-striped', props.isStriped)
      ..add('progress-bar-animated', props.isAnimated)
      ..add(props.skin.className);

    return (Dom.div()
      ..addProps(copyUnconsumedDomProps())
      ..style = progressBarStyles
      ..role = Role.progressbar
      ..className = progressBarClasses.toClassName()
      ..aria.valuenow = currentValue
      ..aria.valuemax = props.max
      ..aria.valuemin = props.min
    )(_caption);
  }

  String get _caption {
    if (props.showPercentComplete) {
      if (props.caption != null) {
        return '${props.caption}${getPercentComplete()}%';
      } else {
        return '${getPercentComplete()}%';
      }
    } else {
      return props.caption;
    }
  }

  /// Get the percentage complete based on [ProgressBarProps.min], [ProgressBarProps.max] and [ProgressBarProps.value].
  double getPercentComplete() => (props.value - props.min) / (props.max - props.min) * 100;

  /// Returns the value that determines the width of the progress bar
  /// within the rendered [ProgressBar] component via [DomPropsMixin.value].
  ///
  /// Note that the value of the HTML `<progress>` element's value
  /// attribute will never be less than the value of [ProgressBarProps.min].
  double get currentValue => max(props.min, props.value);

  @override
  validateProps(Map propsToValidate) {
    super.validateProps(propsToValidate);

    final tPropsToValidate = typedPropsFactory(propsToValidate);
    final rootNodeStyle = domProps(tPropsToValidate.rootNodeProps).style;

    if (rootNodeStyle != null && rootNodeStyle.containsKey('height')) {
      throw new PropError.value(rootNodeStyle['height'], 'rootNodeProps.style', unindent(
          '''
          Do not set `rootNodeProps.style.height`. Set `props.height` instead.
          '''
      ));
    }

    final progressBarStyle = domProps(props).style;

    if (progressBarStyle != null && progressBarStyle.containsKey('width')) {
      throw new PropError.value(progressBarStyle['width'], 'style', unindent(
          '''
          Do not set `style.width` manually. The width should be based on the value of `props.value`.
          '''
      ));
    }
  }
}

/// Contextual skin options for a [ProgressBar] component.
class ProgressBarSkin extends ClassNameConstant {
  const ProgressBarSkin._(String name, String className) : super(name, className);

  static const ProgressBarSkin DEFAULT = const ProgressBarSkin._('DEFAULT', null);
  static const ProgressBarSkin SUCCESS = const ProgressBarSkin._('SUCCESS', bsSuccessBgColorClassName);
  static const ProgressBarSkin DANGER = const ProgressBarSkin._('DANGER', bsDangerBgColorClassName);
  static const ProgressBarSkin WARNING = const ProgressBarSkin._('WARNING', bsWarningBgColorClassName);
  static const ProgressBarSkin INFO = const ProgressBarSkin._('INFO', bsInfoBgColorClassName);
  static const ProgressBarSkin DARK = const ProgressBarSkin._('DARK', bsDarkBgColorClassName);
}
