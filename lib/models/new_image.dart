// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewImage {
  int id;
  String url;
  NewImage({
    required this.id,
    required this.url,
  });

  NewImage copyWith({
    int? id,
    String? url,
  }) {
    return NewImage(
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
    };
  }

  factory NewImage.fromMap(Map<String, dynamic> map) {
    return NewImage(
      id: map['id'] as int,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewImage.fromJson(String source) =>
      NewImage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NewImage(id: $id, url: $url)';

  @override
  bool operator ==(covariant NewImage other) {
    if (identical(this, other)) return true;

    return other.id == id && other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode;
}
