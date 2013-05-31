library links;

import 'dart:uri';

class Link {
  String name;
  Uri url;

  Link(this.name, String link) {
    url = new Uri(link);
  }
}

class Links {
  var _links = new List<Link>();

  add(Link link) {
    _links.add(link);
  }

  List<Link> toList() => _links.toList();
}