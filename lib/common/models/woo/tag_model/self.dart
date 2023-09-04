class Self {
  final String? href;
  Self({this.href});

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(href: json['href']);
  }

  Map<String, dynamic> toJson() => {'href': href};
}
