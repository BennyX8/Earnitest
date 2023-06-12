part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object> get props => [];
}

//* GetPhotos Event
class GetPhotosEvent extends GalleryEvent {
  final int page;
  final int? perPage;
  final String? order;

  const GetPhotosEvent({
    required this.page,
    this.perPage,
    this.order,
  });
}

//* GetMorePhotos Event
class GetMorePhotosEvent extends GalleryEvent {}
