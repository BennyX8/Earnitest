import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:earnitest/core/dependencies/network_info.dart';
import 'package:earnitest/core/errors/exception.dart';
import 'package:earnitest/core/errors/failure.dart';
import 'package:earnitest/core/utils/enum.dart';
import 'package:earnitest/features/gallery/data/models/photo_model.dart';
import 'package:earnitest/features/gallery/data/sources/gallery_service.dart';
import 'package:earnitest/features/gallery/domain/repository/gallery_repository.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryService galleryService;
  final NetworkInfo networkInfo;

  GalleryRepositoryImpl(this.galleryService, this.networkInfo);

  @override
  Future<Either<Failure, List<PhotoModel>>> getPhotos(params) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await galleryService.getPhotos(params));
      } on ServerException catch (e) {
        return Left(Failure(e.toString(), type: ErrorTypes.server));
      } on FormatException {
        return Left(Failure('Invalid Response', type: ErrorTypes.format));
      } on HandshakeException {
        return Left(Failure('Network Failure', type: ErrorTypes.handshake));
      } on Socket {
        return Left(Failure('Network Failure', type: ErrorTypes.handshake));
      } catch (e) {
        return Left(Failure(e.toString(), type: ErrorTypes.unknown));
      }
    } else {
      return Left(Failure('No data connection', type: ErrorTypes.data));
    }
  }
}
