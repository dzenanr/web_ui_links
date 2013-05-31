import 'dart:html';
import 'dart:json';
import 'dart:uri';

import 'package:web_ui/web_ui.dart';
import 'package:web_links/links.dart';

class WebLinks extends WebComponent {
  Links webLinks = Links.one;

  add() {
    InputElement name = query("#name");
    InputElement url = query("#url");
    LabelElement message = query("#message");
    var error = false;
    message.text = '';
    if (name.value.trim() == '') {
      message.text = 'name is mandatory; ${message.text}';
      error = true;
    }
    if (url.value.trim() == '') {
      message.text = 'web link is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var webLink = new Link(name.value, url.value);
      if (webLinks.add(webLink)) {
        webLinks.order();
        save();
      } else {
        message.text = 'web link with that name already exists';
        error = true;
      }
    }
  }

  save() {
    window.localStorage['web_links'] =
        stringify(webLinks.toJson());
  }
}