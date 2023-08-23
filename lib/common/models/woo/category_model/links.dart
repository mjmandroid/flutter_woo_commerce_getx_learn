class Links {
  List<Self>? self;
  List<Collection>? collection;

  Links({this.self, this.collection});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: (json['self'] as List<dynamic>?)
          ?.map((e) => Self.fromJson(e))
          .toList(),
      collection: (json['collection'] as List<dynamic>?)
          ?.map((e) => Collection.fromJson(e))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() => {
        'self': self?.map((e) => e.toJson()).toList(),
        'collection': collection?.map((e) => e.toJson()).toList(),
      };
}

class Self {
  String? href;

  Self({this.href});

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(href: json['href'] as String?);
  }

  Map<String, dynamic> toJson() => {'href': href};
}

class Collection {
  String? href;

  Collection({this.href});

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(href: json['href'] as String?);
  }

  Map<String, dynamic> toJson() => {'href': href};
}
