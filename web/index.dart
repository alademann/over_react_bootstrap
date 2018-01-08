import 'dart:html';

import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' show setClientConfiguration;

import './demos/constants.dart';
import './demos/demos.dart';

void main() {
  setClientConfiguration();

  react_dom.render(
    buttonExamplesDemo(), querySelector('$demoMountNodeSelectorPrefix--button'));

  react_dom.render(
    listGroupBasicDemo(), querySelector('$demoMountNodeSelectorPrefix--list-group'));

  react_dom.render(
    progressBasicDemo(), querySelector('$demoMountNodeSelectorPrefix--progress'));

  react_dom.render(
    badgeBasicDemo(), querySelector('$demoMountNodeSelectorPrefix--badge'));

  react_dom.render(
    checkboxToggleButtonDemo(), querySelector('$demoMountNodeSelectorPrefix--checkbox-toggle'));

  react_dom.render(
    radioToggleButtonDemo(), querySelector('$demoMountNodeSelectorPrefix--radio-toggle'));
}
