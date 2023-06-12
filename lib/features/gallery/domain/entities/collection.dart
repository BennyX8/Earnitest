import 'package:equatable/equatable.dart';

class UserCollection extends Equatable{
 final int id;
 final String title;
 final DateTime publishedAt;
 final DateTime lastCollectedAt;
 final DateTime updatedAt;
 final dynamic coverPhoto;
 final dynamic user;

  const UserCollection({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.lastCollectedAt,
    required this.updatedAt,
    this.coverPhoto,
    this.user,
  });
  
  @override
  List<Object?> get props => [];
}





