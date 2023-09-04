import 'collection.dart';
import 'self.dart';

class Links {
  final List<Self>? self;
  final List<Collection>? collection;

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
