import 'package:bloc/bloc.dart';
import 'package:earnitest/features/gallery/domain/entities/photo.dart';
import 'package:earnitest/features/gallery/domain/usecases/get_photos.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GetPhotos getPhotos;

  List<Photo> photos = [];
  int page = 1;
  GalleryBloc(this.getPhotos) : super(GalleryInitial()) {
    //Execute this Bloc's On<GetMorePhotosEvent> to
    //fetch subsequent pages of image data from unsplash api
    on<GetPhotosEvent>((event, emit) async {
      emit(GetPhotosLoading());

      page = event.page;

      final result = await getPhotos(GetPhotosParams(page: page));

      emit(result.fold(
        (failure) => GetPhotosError(failure),
        (photos) {
          //Increment Page count for fetch
          page++;

          //Assign the first set of loaded photos
          //to the global list of photos
          this.photos = photos;

          //Return Success or Loaded state containing
          //the updated list of photos
          return GetPhotosLoaded(this.photos);
        },
      ));
    });

    //Execute this Bloc's On<GetMorePhotosEvent> to
    //fetch subsequent pages of image data from unsplash api
    on<GetMorePhotosEvent>((event, emit) async {
      emit(GetPhotosLoading());

      final result = await getPhotos(GetPhotosParams(page: page));

      emit(result.fold(
        (failure) => GetPhotosError(failure),
        (photos) {
          //Increment Page count for fetch
          page++;

          //Add recently loaded photos to the previous
          //list of photos available
          this.photos.addAll(photos);

          //Return Success or Loaded state containing
          //the updated list of photos
          return GetPhotosLoaded(this.photos);
        },
      ));
    });
  }
}
