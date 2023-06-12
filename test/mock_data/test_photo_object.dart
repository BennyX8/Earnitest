import 'package:earnitest/features/gallery/data/models/photo_links_model.dart';
import 'package:earnitest/features/gallery/domain/entities/collection.dart';
import 'package:earnitest/features/gallery/domain/entities/photo.dart';

import 'test_user_object.dart';

List<UserCollection> collections = [];

final testPhoto = Photo(
  id: 'id',
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
  width: 45,
  height: 45,
  color: '#ffffff',
  blurHash: '',
  likes: 0,
  likedByUser: false,
  description: '',
  user: testUser,
  currentUserCollections: collections,
  urls: testUrl,
  links: testPhotoLinks,
);

const testPhotoLinks = PhotoLinksModel(
  self: 'self',
  html: 'html',
  download: 'download',
  downloadLocation: 'downloadLocation',
);
