import 'dart:html';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart';

import '../constants.dart';
import '../demos.dart';

main() {
  setClientConfiguration();

  react_dom.render(badgeBasicDemo(), querySelector('$demoMountNodeSelectorPrefix--badge-basic'));

  react_dom.render(badgeContextualDemo(), querySelector('$demoMountNodeSelectorPrefix--badge-contextual'));

  react_dom.render(badgePillsDemo(), querySelector('$demoMountNodeSelectorPrefix--badge-pills'));
}
