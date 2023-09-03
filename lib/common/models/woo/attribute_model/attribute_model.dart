class AttributeModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? menu_order;
  int? count;
  Links? links;

  AttributeModel({
    this.id,
    this.name,
    this.slug,
    this.count,
    this.description,
    this.menu_order,
    this.links,
  });

  factory AttributeModel.fromJson(Map<String, dynamic> json) {
    return AttributeModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      count: json['count'] as int?,
      description: json['description'] as String?,
      menu_order: json['menu_order'] as int?,
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'description': description,
        'menu_order': menu_order,
        'count': count,
        '_links': links?.toJson(),
      };
}

class Links {
  List<Self>? self;
  List<Collection>? collection;

  Links({this.collection, this.self});

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
