library links;

import 'dart:uri';

class Link {
  String name;
  Uri url;

  Link(this.name, String link) {
    url = new Uri(link);
  }
}

