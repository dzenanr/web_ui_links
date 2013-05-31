library links;

import 'dart:uri';

class Link {
  String name;
  Uri url;

  Link(this.name, String link) {
    url = new Uri(link);
  }

  Link.fromJson(Map<String, Object> linkMap) {
    name = linkMap['name'];
    url = new Uri(linkMap['url']);
  }

  Map<String, Object> toJson() {
    var linkMap = new Map<String, Object>();
    linkMap['name'] = name;
    linkMap['url'] = url.toString();
    return linkMap;
  }

  /**
   * Compares two links based on their names.
   * If the result is less than 0 then the first link is less than the second,
   * if it is equal to 0 they are equal and
   * if the result is greater than 0 then the first is greater than the second.
   */
  int compareTo(Link link) {
    if (name != null && link.name != null) {
      return name.compareTo(link.name);
    } else {
      throw new Exception('a link name must be present');
    }
  }

}

class Links {
  var _links = new List<Link>();

  // singleton design pattern: http://en.wikipedia.org/wiki/Singleton_pattern
  Links.private();
  static Links singleton = null;
  static Links get one {
    if (singleton == null) {
      singleton = new Links.private();
    }
    return singleton;
  }

  init() {
    var link1 = new Link('On Dart', 'http://ondart.me/');
    var link2 = new Link('Web UI', 'http://www.dartlang.org/articles/web-ui/');
    var link3 = new Link('Books To Read', 'http://www.goodreads.com/');
    singleton.add(link1);
    singleton.add(link2);
    singleton.add(link3);
  }

  Iterator<Link> get iterator => _links.iterator;

  List<Link> toList() => _links.toList();

  bool add(Link newLink) {
    if (newLink == null) {
      throw new Exception('a new link must be present');
    }
    for (Link link in this) {
      if (newLink.name == link.name) return false;
    }
    _links.add(newLink);
    return true;
  }

  List<Map<String, Object>> toJson() {
    var linkList = new List<Map<String, Object>>();
    for (Link link in _links) {
      linkList.add(link.toJson());
    }
    return linkList;
  }

  fromJson(List<Map<String, Object>> linkList) {
    if (_links.length > 0) {
      throw new Exception('links are not empty');
    }
    for (Map<String, Object> linkMap in linkList) {
      Link link = new Link.fromJson(linkMap);
      add(link);
    }
  }

  order() {
    // in place sort
    _links.sort((m,n) => m.compareTo(n));
  }

}