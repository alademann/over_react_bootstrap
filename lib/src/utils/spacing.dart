part of over_react_bootstrap.utils;

// ********************************************************
//
//  PUBLIC API
//
// ********************************************************

/// A props mixin that should be mixed into any component that deserves a prop-based API for adding
/// [Bootstrap CSS spacing utility classes](https://getbootstrap.com/docs/4.0/utilities/spacing/).
///
/// The component class that utilizes the props class that this gets mixed into should mix in the
/// [BsSpacingUtils] class.
@PropsMixin()
abstract class BsSpacingProps implements UiProps {
  @override
  Map get props;

  BsSpacingSize marginTop;
  BsSpacingSize marginTopSm;
  BsSpacingSize marginTopMd;
  BsSpacingSize marginTopLg;

  BsSpacingSize marginRight;
  BsSpacingSize marginRightSm;
  BsSpacingSize marginRightMd;
  BsSpacingSize marginRightLg;

  BsSpacingSize marginBottom;
  BsSpacingSize marginBottomSm;
  BsSpacingSize marginBottomMd;
  BsSpacingSize marginBottomLg;

  BsSpacingSize marginLeft;
  BsSpacingSize marginLeftSm;
  BsSpacingSize marginLeftMd;
  BsSpacingSize marginLeftLg;

  BsSpacingSize marginHorizontal;
  BsSpacingSize marginHorizontalSm;
  BsSpacingSize marginHorizontalMd;
  BsSpacingSize marginHorizontalLg;

  BsSpacingSize marginVertical;
  BsSpacingSize marginVerticalSm;
  BsSpacingSize marginVerticalMd;
  BsSpacingSize marginVerticalLg;

  BsSpacingSize margin;
  BsSpacingSize marginSm;
  BsSpacingSize marginMd;
  BsSpacingSize marginLg;

  BsSpacingSize paddingTop;
  BsSpacingSize paddingTopSm;
  BsSpacingSize paddingTopMd;
  BsSpacingSize paddingTopLg;

  BsSpacingSize paddingRight;
  BsSpacingSize paddingRightSm;
  BsSpacingSize paddingRightMd;
  BsSpacingSize paddingRightLg;

  BsSpacingSize paddingBottom;
  BsSpacingSize paddingBottomSm;
  BsSpacingSize paddingBottomMd;
  BsSpacingSize paddingBottomLg;

  BsSpacingSize paddingLeft;
  BsSpacingSize paddingLeftSm;
  BsSpacingSize paddingLeftMd;
  BsSpacingSize paddingLeftLg;

  BsSpacingSize paddingHorizontal;
  BsSpacingSize paddingHorizontalSm;
  BsSpacingSize paddingHorizontalMd;
  BsSpacingSize paddingHorizontalLg;

  BsSpacingSize paddingVertical;
  BsSpacingSize paddingVerticalSm;
  BsSpacingSize paddingVerticalMd;
  BsSpacingSize paddingVerticalLg;

  BsSpacingSize padding;
  BsSpacingSize paddingSm;
  BsSpacingSize paddingMd;
  BsSpacingSize paddingLg;

}

/// A [UiComponent] mixin to be used alongside [BsSpacingProps] that provides CSS class construction utilities.
abstract class BsSpacingUtils<T extends BsSpacingProps> {
  T get props;

  /// Overwrites `over_react.component_base.forwardingClassNameBuilder` when the parent class is mixed in.
  ClassNameBuilder forwardingClassNameBuilder() {
    return bsSpacingClassNameBuilder()
      ..addFromProps(this.props);
  }

  /// Returns a new `ClassNameBuilder` with the
  /// [Bootstrap CSS spacing utility classes](https://getbootstrap.com/docs/4.0/utilities/spacing/) based on any
  /// [BsSpacingProps] values found in this component's props.
  ClassNameBuilder bsSpacingClassNameBuilder() => new ClassNameBuilder()
    ..add(bsMargin(props.margin), props.margin != null)
    ..add(bsMargin(props.marginSm, BsMediaQueryWidthBreakpoint.SMALL), props.marginSm != null)
    ..add(bsMargin(props.marginMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.marginMd != null)
    ..add(bsMargin(props.marginLg, BsMediaQueryWidthBreakpoint.LARGE), props.marginLg != null)
    ..add(bsMarginHorizontal(props.marginHorizontal), props.marginHorizontal != null)
    ..add(bsMarginHorizontal(props.marginHorizontalSm, BsMediaQueryWidthBreakpoint.SMALL), props.marginHorizontalSm != null)
    ..add(bsMarginHorizontal(props.marginHorizontalMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.marginHorizontalMd != null)
    ..add(bsMarginHorizontal(props.marginHorizontalLg, BsMediaQueryWidthBreakpoint.LARGE), props.marginHorizontalLg != null)
    ..add(bsMarginVertical(props.marginVertical), props.marginVertical != null)
    ..add(bsMarginVertical(props.marginVerticalSm, BsMediaQueryWidthBreakpoint.SMALL), props.marginVerticalSm != null)
    ..add(bsMarginVertical(props.marginVerticalMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.marginVerticalMd != null)
    ..add(bsMarginVertical(props.marginVerticalLg, BsMediaQueryWidthBreakpoint.LARGE), props.marginVerticalLg != null)
    ..add(bsMarginTop(props.marginTop), props.marginTop != null)
    ..add(bsMarginTop(props.marginTopSm, BsMediaQueryWidthBreakpoint.SMALL), props.marginTopSm != null)
    ..add(bsMarginTop(props.marginTopMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.marginTopMd != null)
    ..add(bsMarginTop(props.marginTopLg, BsMediaQueryWidthBreakpoint.LARGE), props.marginTopLg != null)
    ..add(bsMarginRight(props.marginRight), props.marginRight != null)
    ..add(bsMarginRight(props.marginRightSm, BsMediaQueryWidthBreakpoint.SMALL), props.marginRightSm != null)
    ..add(bsMarginRight(props.marginRightMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.marginRightMd != null)
    ..add(bsMarginRight(props.marginRightLg, BsMediaQueryWidthBreakpoint.LARGE), props.marginRightLg != null)
    ..add(bsMarginBottom(props.marginBottom), props.marginBottom != null)
    ..add(bsMarginBottom(props.marginBottomSm, BsMediaQueryWidthBreakpoint.SMALL), props.marginBottomSm != null)
    ..add(bsMarginBottom(props.marginBottomMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.marginBottomMd != null)
    ..add(bsMarginBottom(props.marginBottomLg, BsMediaQueryWidthBreakpoint.LARGE), props.marginBottomLg != null)
    ..add(bsMarginLeft(props.marginLeft), props.marginLeft != null)
    ..add(bsMarginLeft(props.marginLeftSm, BsMediaQueryWidthBreakpoint.SMALL), props.marginLeftSm != null)
    ..add(bsMarginLeft(props.marginLeftMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.marginLeftMd != null)
    ..add(bsMarginLeft(props.marginLeftLg, BsMediaQueryWidthBreakpoint.LARGE), props.marginLeftLg != null)
    ..add(bsPadding(props.padding), props.padding != null)
    ..add(bsPadding(props.paddingSm, BsMediaQueryWidthBreakpoint.SMALL), props.paddingSm != null)
    ..add(bsPadding(props.paddingMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.paddingMd != null)
    ..add(bsPadding(props.paddingLg, BsMediaQueryWidthBreakpoint.LARGE), props.paddingLg != null)
    ..add(bsPaddingHorizontal(props.paddingHorizontal), props.paddingHorizontal != null)
    ..add(bsPaddingHorizontal(props.paddingHorizontalSm, BsMediaQueryWidthBreakpoint.SMALL), props.paddingHorizontalSm != null)
    ..add(bsPaddingHorizontal(props.paddingHorizontalMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.paddingHorizontalMd != null)
    ..add(bsPaddingHorizontal(props.paddingHorizontalLg, BsMediaQueryWidthBreakpoint.LARGE), props.paddingHorizontalLg != null)
    ..add(bsPaddingVertical(props.paddingVertical), props.paddingVertical != null)
    ..add(bsPaddingVertical(props.paddingVerticalSm, BsMediaQueryWidthBreakpoint.SMALL), props.paddingVerticalSm != null)
    ..add(bsPaddingVertical(props.paddingVerticalMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.paddingVerticalMd != null)
    ..add(bsPaddingVertical(props.paddingVerticalLg, BsMediaQueryWidthBreakpoint.LARGE), props.paddingVerticalLg != null)
    ..add(bsPaddingTop(props.paddingTop), props.paddingTop != null)
    ..add(bsPaddingTop(props.paddingTopSm, BsMediaQueryWidthBreakpoint.SMALL), props.paddingTopSm != null)
    ..add(bsPaddingTop(props.paddingTopMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.paddingTopMd != null)
    ..add(bsPaddingTop(props.paddingTopLg, BsMediaQueryWidthBreakpoint.LARGE), props.paddingTopLg != null)
    ..add(bsPaddingRight(props.paddingRight), props.paddingRight != null)
    ..add(bsPaddingRight(props.paddingRightSm, BsMediaQueryWidthBreakpoint.SMALL), props.paddingRightSm != null)
    ..add(bsPaddingRight(props.paddingRightMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.paddingRightMd != null)
    ..add(bsPaddingRight(props.paddingRightLg, BsMediaQueryWidthBreakpoint.LARGE), props.paddingRightLg != null)
    ..add(bsPaddingBottom(props.paddingBottom), props.paddingBottom != null)
    ..add(bsPaddingBottom(props.paddingBottomSm, BsMediaQueryWidthBreakpoint.SMALL), props.paddingBottomSm != null)
    ..add(bsPaddingBottom(props.paddingBottomMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.paddingBottomMd != null)
    ..add(bsPaddingBottom(props.paddingBottomLg, BsMediaQueryWidthBreakpoint.LARGE), props.paddingBottomLg != null)
    ..add(bsPaddingLeft(props.paddingLeft), props.paddingLeft != null)
    ..add(bsPaddingLeft(props.paddingLeftSm, BsMediaQueryWidthBreakpoint.SMALL), props.paddingLeftSm != null)
    ..add(bsPaddingLeft(props.paddingLeftMd, BsMediaQueryWidthBreakpoint.MEDIUM), props.paddingLeftMd != null)
    ..add(bsPaddingLeft(props.paddingLeftLg, BsMediaQueryWidthBreakpoint.LARGE), props.paddingLeftLg != null);
}

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `margin-top` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsTopMargin(BsSpacingSize.THREE))(
///       '"base" margin amount applied to the top edge'
///     )
///
///     (Dom.div()..className = bsTopMargin(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied to the top edge above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsPaddingTop]
String bsMarginTop(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsMarginUtil.top(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `padding-top` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsTopPadding(BsSpacingSize.THREE))(
///       '"base" padding amount applied inside the top edge'
///     )
///
///     (Dom.div()..className = bsTopPadding(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" padding amount applied inside the top edge above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsMarginTop]
String bsPaddingTop(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsPaddingUtil.top(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `margin-bottom` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsBottomMargin(BsSpacingSize.THREE))(
///       '"base" margin amount applied to the bottom edge'
///     )
///
///     (Dom.div()..className = bsBottomMargin(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied to the bottom edge above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsPaddingBottom]
String bsMarginBottom(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsMarginUtil.bottom(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `padding-bottom` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsBottomPadding(BsSpacingSize.THREE))(
///       '"base" margin amount applied inside the bottom edge'
///     )
///
///     (Dom.div()..className = bsBottomPadding(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied inside the bottom edge above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsMarginBottom]
String bsPaddingBottom(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsPaddingUtil.bottom(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `margin-left` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsLeftMargin(BsSpacingSize.THREE))(
///       '"base" margin amount applied to the left edge'
///     )
///
///     (Dom.div()..className = bsLeftMargin(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied to the left edge above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsPaddingLeft]
String bsMarginLeft(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsMarginUtil.left(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `padding-left` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsLeftPadding(BsSpacingSize.THREE))(
///       '"base" margin amount applied inside the left edge'
///     )
///
///     (Dom.div()..className = bsLeftPadding(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied inside the left edge above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsMarginLeft]
String bsPaddingLeft(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsPaddingUtil.left(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `margin-right` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsRightMargin(BsSpacingSize.THREE))(
///       '"base" margin amount applied to the right edge'
///     )
///
///     (Dom.div()..className = bsRightMargin(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied to the right edge above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsPaddingRight]
String bsMarginRight(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsMarginUtil.right(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `padding-right` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsRightPadding(BsSpacingSize.THREE))(
///       '"base" margin amount applied inside the right edge'
///     )
///
///     (Dom.div()..className = bsRightPadding(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied inside the right edge above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsMarginRight]
String bsPaddingRight(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsPaddingUtil.right(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `margin-right` and `margin-left` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsHorizontalMargin(BsSpacingSize.THREE))(
///       '"base" margin amount applied to the left and right edges'
///     )
///
///     (Dom.div()..className = bsHorizontalMargin(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied to the left and right edges above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsPaddingHorizontal]
String bsMarginHorizontal(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsMarginUtil.horizontal(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `padding-right` and `padding-left` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsHorizontalPadding(BsSpacingSize.THREE))(
///       '"base" margin amount applied inside the left and right edges'
///     )
///
///     (Dom.div()..className = bsHorizontalPadding(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied inside the left and right edges above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsMarginHorizontal]
String bsPaddingHorizontal(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsPaddingUtil.horizontal(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `margin-top` and `margin-bottom` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsVerticalMargin(BsSpacingSize.THREE))(
///       '"base" margin amount applied to the bottom and top edges'
///     )
///
///     (Dom.div()..className = bsVerticalMargin(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied to the bottom and top edges above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsPaddingVertical]
String bsMarginVertical(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsMarginUtil.horizontal(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `padding-top` and `padding-bottom` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsVerticalPadding(BsSpacingSize.THREE))(
///       '"base" margin amount applied inside the bottom and top edges'
///     )
///
///     (Dom.div()..className = bsVerticalPadding(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied inside the bottom and top edges above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsMarginVertical]
String bsPaddingVertical(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsPaddingUtil.horizontal(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `margin` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsMargin(BsSpacingSize.THREE))(
///       '"base" margin amount applied to all edges'
///     )
///
///     (Dom.div()..className = bsMargin(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied to all edges above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsPadding]
String bsMargin(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsMarginUtil.all(size, breakpoint).className;

/// Returns the [Bootstrap CSS spacing utility class](https://getbootstrap.com/docs/4.0/utilities/spacing/)
/// that sets a `padding` value based on the provided [size] and optionally, the provided [breakpoint].
///
/// For use as [CssClassPropsMixin.className] values.
///
/// __Example:__
///
///     (Dom.div()..className = bsPadding(BsSpacingSize.THREE))(
///       '"base" margin amount applied inside all edges'
///     )
///
///     (Dom.div()..className = bsPadding(BsSpacingSize.THREE, BsMediaQueryWidthBreakpoint.SMALL))(
///       '"base" margin amount applied inside all edges above the "sm" responsive breakpoint'
///     )
///
/// > Related: [bsMargin]
String bsPadding(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
    new _BsPaddingUtil.all(size, breakpoint).className;

/// A class of constants that correspond to the amount of margin / padding the CSS class will add.
///
/// > For use in top-level helpers:
/// >
/// > * [bsMarginTop] / [bsPaddingTop]
/// > * [bsMarginBottom] / [bsPaddingBottom]
/// > * [bsMarginLeft] / [bsPaddingLeft]
/// > * [bsMarginRight] / [bsPaddingRight]
/// > * [bsMarginHorizontal] / [bsPaddingHorizontal]
/// > * [bsMarginVertical] / [bsPaddingVertical]
/// > * [bsMargin] / [bsPadding]
///
/// > See: https://getbootstrap.com/docs/4.0/utilities/spacing/
class BsSpacingSize extends _BsClassNamePartUtil {
  const BsSpacingSize._(String name, String classNamePart) : super._(name, classNamePart);

  /// For CSS classes that eliminate the `margin` or `padding` by setting it to `0`.
  ///
  /// > Aliased as [NONE].
  static const BsSpacingSize ZERO = const BsSpacingSize._('ZERO', '0');

  /// For classes that set the `margin` or `padding` to (SCSS) `$spacer * .25`.
  static const BsSpacingSize ONE = const BsSpacingSize._('ONE', '1');

  /// For classes that set the `margin` or `padding` to (SCSS) `$spacer * .5`.
  static const BsSpacingSize TWO = const BsSpacingSize._('TWO', '2');

  /// For classes that set the `margin` or `padding` to (SCSS) `$spacer`.
  ///
  /// > Aliased as [BASE] / [DEFAULT].
  static const BsSpacingSize THREE = const BsSpacingSize._('THREE', '3');

  /// For classes that set the `margin` or `padding` to (SCSS) `$spacer * 1.5`.
  static const BsSpacingSize FOUR = const BsSpacingSize._('FOUR', '4');

  /// For classes that set the `margin` or `padding` to (SCSS) `$spacer * 3`.
  static const BsSpacingSize FIVE = const BsSpacingSize._('FIVE', '5');

  /// For classes that set the `margin` or `padding` to `auto`.
  static const BsSpacingSize AUTO = const BsSpacingSize._('AUTO', 'auto');

  /// Alias for [ZERO].
  static const BsSpacingSize NONE = ZERO;

  /// Alias for [THREE].
  static const BsSpacingSize BASE = THREE;

  /// Alias for [THREE].
  static const BsSpacingSize DEFAULT = THREE;
}


// ********************************************************
//
//  PRIVATE CSS CLASS CONSTRUCTION HELPERS
//
// ********************************************************

class _BsSpacingProperty extends _BsClassNamePartUtil {
  const _BsSpacingProperty._(String name, String classNamePart) : super._(name, classNamePart);

  static const _BsSpacingProperty PADDING = const _BsSpacingProperty._('PADDING', 'p');
  static const _BsSpacingProperty MARGIN = const _BsSpacingProperty._('MARGIN', 'm');
}

class _BsSpacingSide extends _BsClassNamePartUtil {
  const _BsSpacingSide._(String name, String classNamePart) : super._(name, classNamePart);

  static const _BsSpacingSide T = const _BsSpacingSide._('T', 't-');
  static const _BsSpacingSide B = const _BsSpacingSide._('B', 'b-');
  static const _BsSpacingSide L = const _BsSpacingSide._('L', 'l-');
  static const _BsSpacingSide R = const _BsSpacingSide._('R', 'r-');
  static const _BsSpacingSide X = const _BsSpacingSide._('X', 'x-');
  static const _BsSpacingSide Y = const _BsSpacingSide._('Y', 'y-');
  static const _BsSpacingSide ALL = const _BsSpacingSide._('ALL', '-');
}

abstract class _BsSpacingUtil {
  final BsSpacingSize size;

  final BsMediaQueryWidthBreakpoint breakpoint;

  final _BsSpacingProperty property;

  final _BsSpacingSide side;

  String className;

  _BsSpacingUtil(this.property, this.side, this.size, [this.breakpoint]) {
    if (property == null || side == null || size == null) {
      className = '';
    } else {
      className = breakpoint == null
          ? '${property.classNamePart}${side.classNamePart}${size.classNamePart}'
          : '${property.classNamePart}${side.classNamePart}${breakpoint.classNamePart}-${size.classNamePart}';
    }
  }
}

class _BsMarginUtil extends _BsSpacingUtil {
  _BsMarginUtil(_BsSpacingSide side, BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint])
      : super(_BsSpacingProperty.MARGIN, side, size, breakpoint);

  factory _BsMarginUtil.top(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsMarginUtil(_BsSpacingSide.T, size, breakpoint);
  factory _BsMarginUtil.bottom(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsMarginUtil(_BsSpacingSide.B, size, breakpoint);
  factory _BsMarginUtil.left(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsMarginUtil(_BsSpacingSide.L, size, breakpoint);
  factory _BsMarginUtil.right(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsMarginUtil(_BsSpacingSide.R, size, breakpoint);
  factory _BsMarginUtil.horizontal(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsMarginUtil(_BsSpacingSide.X, size, breakpoint);
  factory _BsMarginUtil.vertical(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsMarginUtil(_BsSpacingSide.Y, size, breakpoint);
  factory _BsMarginUtil.all(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsMarginUtil(_BsSpacingSide.ALL, size, breakpoint);
}

class _BsPaddingUtil extends _BsSpacingUtil {
  _BsPaddingUtil(_BsSpacingSide side, BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint])
      : super(_BsSpacingProperty.MARGIN, side, size, breakpoint);

  factory _BsPaddingUtil.top(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsPaddingUtil(_BsSpacingSide.T, size, breakpoint);
  factory _BsPaddingUtil.bottom(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsPaddingUtil(_BsSpacingSide.B, size, breakpoint);
  factory _BsPaddingUtil.left(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsPaddingUtil(_BsSpacingSide.L, size, breakpoint);
  factory _BsPaddingUtil.right(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsPaddingUtil(_BsSpacingSide.R, size, breakpoint);
  factory _BsPaddingUtil.horizontal(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsPaddingUtil(_BsSpacingSide.X, size, breakpoint);
  factory _BsPaddingUtil.vertical(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsPaddingUtil(_BsSpacingSide.Y, size, breakpoint);
  factory _BsPaddingUtil.all(BsSpacingSize size, [BsMediaQueryWidthBreakpoint breakpoint]) =>
      new _BsPaddingUtil(_BsSpacingSide.ALL, size, breakpoint);
}
