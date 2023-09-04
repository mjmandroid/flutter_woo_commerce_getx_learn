class Collection {
  final String? href;

  Collection({this.href});

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(href: json['href']);
  }

  Map<String, dynamic> toJson() => {'href': href};
}
