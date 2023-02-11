// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class New {
  final int id;
  final String title;
  final String description;
  final int view;
  final String created_on;
  final String updated_on;
  final List images;
  New({
    required this.id,
    required this.title,
    required this.description,
    required this.view,
    required this.created_on,
    required this.updated_on,
    required this.images,
  });

  New copyWith({
    int? id,
    String? title,
    String? description,
    int? view,
    String? created_on,
    String? updated_on,
    List? images,
  }) {
    return New(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      view: view ?? this.view,
      created_on: created_on ?? this.created_on,
      updated_on: updated_on ?? this.updated_on,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'view': view,
      'created_on': created_on,
      'updated_on': updated_on,
      'images': images,
    };
  }

  factory New.fromMap(Map<String, dynamic> map) {
    return New(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      view: map['view'] as int,
      created_on: map['created_on'] as String,
      updated_on: map['updated_on'] as String,
      images: List.from((map['images'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory New.fromJson(String source) =>
      New.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'New(id: $id, title: $title, description: $description, view: $view, created_on: $created_on, updated_on: $updated_on, images: $images)';
  }

  @override
  bool operator ==(covariant New other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.view == view &&
        other.created_on == created_on &&
        other.updated_on == updated_on &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        view.hashCode ^
        created_on.hashCode ^
        updated_on.hashCode ^
        images.hashCode;
  }
}
