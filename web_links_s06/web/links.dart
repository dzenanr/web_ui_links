import 'dart:html';
import 'dart:json';
import 'dart:uri';

import 'package:web_ui/web_ui.dart';
import 'package:web_links/web_links.dart';

class WebLinks extends WebComponent {
  Links webLinks = Links.one;

  add() {
    InputElement name = query("#name");
    InputElement url = query("#url");
    LabelElement message = query("#message");
    message.text = '';
    var webLink = new Link(name.value, url.value);
    if (webLinks.add(webLink)) {
      webLinks.order();
      save();
    } else {
      message.text = 'web link with that name already exists';
    }
  }

  remove() {
    InputElement name = query("#name");
    InputElement url = query("#url");
    LabelElement message = query("#message");
    message.text = '';
    Link link = webLinks.find(name.value);
    if (webLinks.remove(link)) {
      message.text = 'web link removed';
      save();
    } else {
      message.text = 'web link with this name does not exist';
    }
  }

  save() {
    window.localStorage['web_links'] =
        stringify(webLinks.toJson());
  }
}