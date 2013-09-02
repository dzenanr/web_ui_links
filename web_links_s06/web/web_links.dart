import 'dart:html';
import 'dart:convert';

import 'package:web_links/links.dart';
import 'package:web_ui/web_ui.dart';

/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/web-ui/ .
 */

@observable
String s = '';

load() {
  String json = window.localStorage['web_links'];
  if (json == null) {
    Model.one.init();
  } else {
    Model.one.fromJson(JSON.decode(json));
  }
}

main() {
  toObservable(Model.one.links.internalList);
  //Model.one.links.internalList = toObservable(Model.one.links.internalList);
  load();
}
