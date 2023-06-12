import 'package:dartz/dartz.dart';
import 'package:earnitest/features/gallery/domain/entities/photo.dart';

import '../../../../core/errors/failure.dart';
import '../usecases/get_photos.dart';

abstract class GalleryRepository {
  Future<Either<Failure, List<Photo>>> getPhotos(GetPhotosParams params);
}
