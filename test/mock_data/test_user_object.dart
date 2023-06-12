import 'package:earnitest/features/gallery/domain/entities/photo.dart';
import 'package:earnitest/features/profile/data/models/user_model.dart';
import 'package:earnitest/features/profile/domain/entities/user.dart';

final testUser = User(
  id: 'id',
  username: 'username',
  name: 'name',
  portfolioUrl: '',
  bio: '',
  location: null,
  totalLikes: 0,
  totalPhotos: 1,
  totalCollections: 1,
  instagramUsername: '',
  twitterUsername: '',
  profileImage: ProfileImage(small: 'small', medium: 'medium', large: 'large'),
  links: UserLinks(
    self: 'self',
    html: 'html',
    photos: 'photos',
    likes: 'likes',
    portfolio: 'portfolio',
  ),
);

final testUrl = Urls(
  raw: 'raw',
  full: 'full',
  regular: 'regular',
  small: 'small',
  thumb: 'thumb',
);
