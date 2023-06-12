// ignore_for_file: overridden_fields, annotate_overrides
import 'package:earnitest/features/profile/domain/entities/user.dart';

class UserModel extends User {
  String id;
  String username;
  String name;
  String? portfolioUrl;
  String? bio;
  String? location;
  int totalLikes;
  int totalPhotos;
  int totalCollections;
  String? instagramUsername;
  String? twitterUsername;
  ProfileImage profileImage;
  UserLinks links;

  UserModel({
    required this.id,
    required this.username,
    required this.name,
     this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.totalLikes,
    required this.totalPhotos,
    required this.totalCollections,
    required this.instagramUsername,
    required this.twitterUsername,
    required this.profileImage,
    required this.links,
  }) : super(
          id: id,
          username: username,
          name: name,
          portfolioUrl: portfolioUrl,
          bio: bio,
          location: location,
          totalLikes: totalLikes,
          totalPhotos: totalPhotos,
          totalCollections: totalCollections,
          instagramUsername: instagramUsername,
          twitterUsername: twitterUsername,
          profileImage: profileImage,
          links: links,
        );

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      username: data['username'],
      name: data['name'],
      portfolioUrl: data['portfolio_url'],
      bio: data['bio'] ?? '',
      location: data['location'] ?? '',
      totalLikes: data['total_likes'] ?? 0,
      totalPhotos: data['total_photos'] ?? 0,
      totalCollections: data['total_collections'] ?? 0,
      instagramUsername: data['instagram_username'] ?? '',
      twitterUsername: data['twitter_username'] ?? '',
      profileImage: ProfileImage.fromMap(data['profile_image']),
      links: UserLinks.fromMap(data['links']),
    );
  }
}

class UserLinks {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;

  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
  });

  factory UserLinks.fromMap(Map<String, dynamic> data) {
    return UserLinks(
      self: data['self'],
      html: data['html'],
      photos: data['photos'],
      likes: data['likes'],
      portfolio: data['portfolio'],
    );
  }
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromMap(Map<String, dynamic> data) {
    return ProfileImage(
      small: data['small'],
      medium: data['medium'],
      large: data['large'],
    );
  }
}
