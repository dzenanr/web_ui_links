import 'dart:html';
import 'dart:json';

import 'package:web_links/links.dart';

/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/web-ui/ .
 */

load() {
  String json = window.localStorage['web_links'];
  var links = Links.one;
  if (json == null) {
    links.init();
  } else {
    links.fromJson(parse(json));
  }
}

main() {
  load();
}
