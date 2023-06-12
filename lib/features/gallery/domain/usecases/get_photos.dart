import 'package:dartz/dartz.dart';
import 'package:earnitest/features/gallery/domain/entities/photo.dart';
import 'package:earnitest/features/gallery/domain/repository/gallery_repository.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/dependencies/usecase.dart';
import '../../../../core/errors/failure.dart';

class GetPhotos extends Usecase<List<Photo>, GetPhotosParams> {
  final GalleryRepository galleryRepository;

  GetPhotos(this.galleryRepository);

  @override
  Future<Either<Failure, List<Photo>>> call(params) {
    return galleryRepository.getPhotos(params);
  }
}

class GetPhotosParams extends Equatable {
  final int page;
  final int perPage;
  final String orderBy;

  const GetPhotosParams({
    required this.page,
    this.perPage = 20,
    this.orderBy = 'popular',
  });

  String get toParams => '?page=$page&per_page=$perPage&order_by=$orderBy';

  @override
  List<Object?> get props => [page, perPage, orderBy];
}
