part of 'gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object> get props => [];
}

class GalleryInitial extends GalleryState {}

//* GetPhotos States
class GetPhotosLoaded extends GalleryState {
  final List<Photo> photos;
  const GetPhotosLoaded(this.photos);
}

class GetPhotosLoading extends GalleryState {}

class GetPhotosError extends GalleryState {
  final Failure failure;
  const GetPhotosError(this.failure);
}

