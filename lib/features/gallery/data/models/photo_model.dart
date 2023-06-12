// ignore_for_file: overridden_fields, annotate_overrides

import 'package:earnitest/features/gallery/data/models/photo_links_model.dart';
import 'package:earnitest/features/gallery/domain/entities/photo.dart';
import 'package:earnitest/features/profile/data/models/user_model.dart';
import '../../../profile/domain/entities/user.dart';
import 'collection_model.dart';

class PhotoModel extends Photo {
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
  final List<UserCollectionModel> currentUserCollections;
  final Urls urls;
  final PhotoLinksModel links;

  const PhotoModel({
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
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          width: width,
          height: height,
          color: color,
          blurHash: blurHash,
          likes: likes,
          likedByUser: likedByUser,
          description: description,
          user: user,
          currentUserCollections: currentUserCollections,
          urls: urls,
          links: links,
        );

  factory PhotoModel.fromMap(Map<String, dynamic> data) {
    final List<UserCollectionModel> collections = [];

    for (final item in data['current_user_collections']) {
      collections.add(UserCollectionModel.fromMap(item));
    }
    return PhotoModel(
      id: data['id'],
      createdAt: DateTime.parse(data['created_at']),
      updatedAt: DateTime.parse(data['updated_at']),
      width: data['width'],
      height: data['height'],
      color: data['color'],
      blurHash: data['blur_hash'],
      likes: data['likes'],
      likedByUser: data['liked_by_user'],
      description: data['description']??'',
      user: UserModel.fromMap(data['user']),
      currentUserCollections: collections,
      urls: Urls.fromMap(data['urls']),
      links: PhotoLinksModel.fromMap(data['links']),
    );
  }
}
