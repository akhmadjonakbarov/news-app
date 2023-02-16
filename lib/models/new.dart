// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:news_app/models/models.dart' as model;

class New {
  final int id;
  final String title;
  final String description;
  final List images;
  final String created_on;
  final String updated_on;
  New({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.created_on,
    required this.updated_on,
  });
}
