// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Slider {
  final int id;
  final String title;
  final String link;
  final String description;
  final String image;
  Slider({
    required this.id,
    required this.title,
    required this.link,
    required this.description,
    required this.image,
  });

  Slider copyWith({
    int? id,
    String? title,
    String? link,
    String? description,
    String? image,
  }) {
    return Slider(
      id: id ?? this.id,
      title: title ?? this.title,
      link: link ?? this.link,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'link': link,
      'description': description,
      'image': image,
    };
  }

  factory Slider.fromMap(Map<String, dynamic> map) {
    return Slider(
      id: map['id'] as int,
      title: map['title'] as String,
      link: map['link'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Slider.fromJson(String source) =>
      Slider.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Slider(id: $id, title: $title, link: $link, description: $description, image: $image)';
  }

  @override
  bool operator ==(covariant Slider other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.link == link &&
        other.description == description &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        link.hashCode ^
        description.hashCode ^
        image.hashCode;
  }
}
