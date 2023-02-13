// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Comment {
  final int id;
  final String name;
  final String body;
  Comment({
    required this.id,
    required this.name,
    required this.body,
  });

  Comment copyWith({
    int? id,
    String? name,
    String? body,
  }) {
    return Comment(
      id: id ?? this.id,
      name: name ?? this.name,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'body': body,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] as int,
      name: map['name'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Comment(id: $id, name: $name, body: $body)';

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ body.hashCode;
}
