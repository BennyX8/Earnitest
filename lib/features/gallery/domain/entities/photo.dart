import 'package:earnitest/features/gallery/domain/entities/photo_links.dart';

import '../../../profile/domain/entities/user.dart';
import 'collection.dart';

class Photo {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int width;
  final int height;
  final String color;
  final String blurHash;
  final int likes;
  final bool likedByUser;
  final String description;
  final User user;
  final List<UserCollection> currentUserCollections;
  final Urls urls;
  final PhotoLinks links;

  const Photo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.likes,
    required this.likedByUser,
    required this.description,
    required this.user,
    required this.currentUserCollections,
    required this.urls,
    required this.links,
  });
}

class Urls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory Urls.fromMap(Map<String, dynamic> data) {
    return Urls(
      raw: data['raw'],
      full: data['full'],
      regular: data['regular'],
      small: data['small'],
      thumb: data['thumb'],
    );
  }
}
