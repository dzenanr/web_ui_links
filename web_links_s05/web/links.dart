import 'dart:html';
import 'dart:convert';

import 'package:web_ui/web_ui.dart';
import 'package:web_links/links.dart';

class WebLinks extends WebComponent {
  List<Link> webLinks = Model.one.links;

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
      webLinks.add(webLink);
      save();
    }
  }

  save() {
    window.localStorage['web_links'] = JSON.encode(Model.one.toJson());
  }
}