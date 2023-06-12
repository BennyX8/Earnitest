// ignore_for_file: overridden_fields, annotate_overrides

import 'package:earnitest/features/gallery/domain/entities/collection.dart';

class UserCollectionModel extends UserCollection {
  final int id;
  final String title;
  final DateTime publishedAt;
  final DateTime lastCollectedAt;
  final DateTime updatedAt;
  final dynamic coverPhoto;
  final dynamic user;

  const UserCollectionModel({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.lastCollectedAt,
    required this.updatedAt,
    this.coverPhoto,
    this.user,
  }) : super(
          id: id,
          lastCollectedAt: lastCollectedAt,
          publishedAt: publishedAt,
          title: title,
          updatedAt: updatedAt,
          coverPhoto: coverPhoto,
          user: user,
        );

  factory UserCollectionModel.fromMap(Map<String, dynamic> data) {
    return UserCollectionModel(
      id: data['id'],
      title: data['title'],
      publishedAt: DateTime.parse(data['published_at']),
      lastCollectedAt: DateTime.parse(data['last_collected_at']),
      updatedAt: DateTime.parse(data['updated_at']),
    );
  }
}
