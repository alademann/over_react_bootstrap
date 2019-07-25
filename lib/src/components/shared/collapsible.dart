part of over_react_bootstrap.components;

/// A higher-order component that can be wrapped around another component to make it expand / collapse
@Factory()
UiFactory<CollapsibleProps> Collapsible = _$Collapsible;

@Props()
class _$CollapsibleProps extends UiProps {
  /// Determines if the [CollapsibleComponent] is expanded.
  ///
  /// The component will transition in response to the value of this prop.
  ///
  /// Default: `false`
  bool isInitiallyExpanded;

  /// Whether the value of `props.children` should only be rendered when [CollapsibleState.isExpanded] is true.
  ///
  /// Default: `true`
  bool lazyRenderChild;

  Function renderChildrenFn;

  /// Callback that gets called before the [CollapsibleComponent] collapses.
  Callback onWillCollapse;

  /// Callback that gets called before the [CollapsibleComponent] expands.
  Callback onWillExpand;

  /// Callback that gets called after the [CollapsibleComponent] collapses.
  Callback onDidCollapse;

  /// Callback that gets called after the [CollapsibleComponent] expands.
  Callback onDidExpand;
}


@State()
class _$CollapsibleState extends UiState {
  /// The value of the dimension, the component is transitioning in either height or width,
  /// that the [CollapsibleComponent] is set to.
  ///
  /// Depends on [transitionState] and [CollapsibleProps.isInitiallyExpanded].
  String collapsibleDimensionValue;

  /// The current phase of transition the [CollapsibleComponent] is in.
  ///
  /// Default: [CollapseTransitionState.STATIC]
  CollapseTransitionState transitionState;

  /// Whether the [CollapsibleComponent] is expanded.
  ///
  /// Default: [CollapsibleProps.isInitiallyExpanded]
  bool isExpanded;
}

@Component()
class CollapsibleComponent extends UiStatefulComponent<CollapsibleProps, CollapsibleState> {
  @override
  Map getDefaultProps() => (newProps()
    ..isInitiallyExpanded = false
    ..lazyRenderChild = true
  );

  @override
  Map getInitialState() => (newState()
    ..transitionState = CollapseTransitionState.STATIC
    ..isExpanded = props.isInitiallyExpanded
  );

  @override
  void componentWillUpdate(Map nextProps, Map nextState) {
    var tNextState = typedStateFactory(nextState);

    if (tNextState.transitionState == state.transitionState &&
        tNextState.collapsibleDimensionValue == state.collapsibleDimensionValue &&
        tNextState.isExpanded == state.isExpanded) {
      _cachedChildren = null;
    }
  }

  @override
  void componentDidUpdate(Map prevProps, Map prevState) {
    var tPrevState = typedStateFactory(prevState);

    if (tPrevState.transitionState != state.transitionState) {
      _cancelTransitionEventListener();
      switch (state.transitionState) {
        case CollapseTransitionState.PRE_TRANSITIONING:
          _callPreTransitionCallback();
          setState(newState()
            ..transitionState = CollapseTransitionState.TRANSITIONING
            ..collapsibleDimensionValue = state.isExpanded ? '0px' : getCollapsibleDimensionValue()
          );
          break;
        case CollapseTransitionState.TRANSITIONING:
          var startValue = new CssValue.parse(state.collapsibleDimensionValue);
          var endValue = new CssValue.parse(getCollapsibleDimensionValue());
          if (startValue.number == 0 && endValue.number == 0) {
            // No transition event will fire when the start and end values are both 0,
            // so continue immediately onto the next state.
            setState(newState()
              ..transitionState = CollapseTransitionState.POST_TRANSITIONING
            );
          } else {
            _oneEndTransitionListener(getCollapsibleDOMNode(), () {
              if (state.transitionState == CollapseTransitionState.TRANSITIONING) {
                setState(newState()
                  ..transitionState = CollapseTransitionState.POST_TRANSITIONING
                );
              }
            });
          }
          setState(newState()
            ..collapsibleDimensionValue = !state.isExpanded ? '0px' : getCollapsibleDimensionValue()
          );
          break;
        case CollapseTransitionState.POST_TRANSITIONING:
          setState(newState()
            ..transitionState = CollapseTransitionState.STATIC
            ..collapsibleDimensionValue = state.isExpanded ? null : '0px'
          );
          break;
        case CollapseTransitionState.STATIC:
          _callPostTransitionCallback();
          break;
      }
    }
  }

  @override
  void componentWillUnmount() {
    super.componentWillUnmount();

    // In case the component unmounts during a transition, clean up the onTransitionEnd listener.
    _cancelTransitionEventListener();
  }

  @override
  render() {
    return (Dom.div()
      ..addProps(copyUnconsumedDomProps())
      ..className = getCollapsibleClasses().toClassName()
      ..style = (newStyleFromProps(props)..['height'] = state.collapsibleDimensionValue)
    )(
      _renderChildren(),
    );
  }

  dynamic _cachedChildren;

  dynamic _renderChildren() {
    if (props.lazyRenderChild && !state.isExpanded) return null;

    if (props.renderChildrenFn != null) {
      _cachedChildren ??= props.renderChildrenFn();

      return _cachedChildren;
    } else {
      return props.children;
    }
  }

  /// Returns the DOM node to be transitioned in response to the value of [CollapsibleProps.isInitiallyExpanded].
  Element getCollapsibleDOMNode() => findDomNode(this);

  /// Returns the current value of the dimension the component is transitioning in.
  String getCollapsibleDimensionValue() => '${getCollapsibleDOMNode().scrollHeight}px';

  /// Returns the classes to be applied to the component that is transitioning.
  ClassNameBuilder getCollapsibleClasses() => forwardingClassNameBuilder()
    ..add('collapsing', state.transitionState != CollapseTransitionState.STATIC)
    ..add('collapse', state.transitionState == CollapseTransitionState.STATIC)
    ..add('show', state.isExpanded && state.transitionState == CollapseTransitionState.STATIC);

  StreamSubscription _endTransitionSubscription;

  void _callPreTransitionCallback() {
    if (state.isExpanded) {
      if (props.onWillExpand != null) {
        props.onWillExpand();
      }
    } else {
      if (props.onWillCollapse != null) {
        props.onWillCollapse();
      }
    }
  }

  void _callPostTransitionCallback() {
    if (state.isExpanded) {
      if (props.onDidExpand != null) {
        props.onDidExpand();
      }
    } else {
      if (props.onDidCollapse != null) {
        props.onDidCollapse();
      }
    }
  }

  void _oneEndTransitionListener(Element node, complete()) {
    _endTransitionSubscription = node.onTransitionEnd.listen((event) {
      _endTransitionSubscription.cancel();
      _endTransitionSubscription = null;
      complete();
    });
  }

  void _cancelTransitionEventListener() {
    if (_endTransitionSubscription != null) {
      _endTransitionSubscription.cancel();
      _endTransitionSubscription = null;
    }
  }

  // ----------------------------------------------------
  //  PUBLIC API
  // ----------------------------------------------------

  void collapse() {
    _cancelTransitionEventListener();

    if (state.isExpanded) {
      setState(newState()
        ..isExpanded = false
        ..transitionState = CollapseTransitionState.PRE_TRANSITIONING
        ..collapsibleDimensionValue = getCollapsibleDimensionValue()
      );
    }
  }

  void expand() {
    _cancelTransitionEventListener();

    if (!state.isExpanded) {
      setState(newState()
        ..isExpanded = true
        ..transitionState = CollapseTransitionState.PRE_TRANSITIONING
        ..collapsibleDimensionValue = '0px'
      );
    }
  }

  void toggle() {
    state.isExpanded ? collapse() : expand();
  }
}

/// Transition state values for an [CollapsibleComponent] instance.
enum CollapseTransitionState {
  /// Resting state where there is no transitioning happening.
  STATIC,
  /// Starts transitioning and sets the appropriate 'from' height of the
  /// [CollapsibleComponent].
  PRE_TRANSITIONING,
  /// Sets the appropriate 'to' height of the [CollapsibleComponent] and
  /// sets up a callback for when the transition is over.
  TRANSITIONING,
  /// Finishes transitioning and removes element specific styling if the
  /// [CollapsibleComponent] is expanded.
  POST_TRANSITIONING
}
