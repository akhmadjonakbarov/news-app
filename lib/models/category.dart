// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:news_app/models/models.dart';

class Category {
  final int id;
  final String name;
  final List news;
  final String description;
  Category({
    required this.id,
    required this.name,
    required this.news,
    required this.description,
  });

  Category copyWith({
    int? id,
    String? name,
    List<New>? news,
    String? description,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      news: news ?? this.news,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'news': news.map((x) => x.toMap()).toList(),
      'description': description,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      news: List<New>.from(
        (map['news'] as List<int>).map<New>(
          (x) => New.fromMap(x as Map<String, dynamic>),
        ),
      ),
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id, name: $name, news: $news, description: $description)';
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.news, news) &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ news.hashCode ^ description.hashCode;
  }
}
