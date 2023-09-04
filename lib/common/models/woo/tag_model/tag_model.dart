import 'links.dart';

class TagModel {
  final int? id;
  final String? name;
  final String? description;
  final int? count;
  final Links? links;

  TagModel({
    this.id,
    this.name,
    this.description,
    this.count,
    this.links,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      count: json['count'],
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'count': count,
        '_links': links?.toJson(),
      };
}
