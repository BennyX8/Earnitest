import 'package:earnitest/core/dependencies/network_info.dart';
import 'package:earnitest/features/gallery/data/repository/gallery_repository_impl.dart';
import 'package:earnitest/features/gallery/data/sources/gallery_service.dart';
import 'package:earnitest/features/gallery/domain/usecases/get_photos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGalleryService extends Mock implements GalleryService {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockGalleryService service;
  late NetworkInfo networkInfo;

  late GalleryRepositoryImpl cut;

  setUp(() {
    service = MockGalleryService();
    networkInfo = MockNetworkInfo();

    cut = GalleryRepositoryImpl(service, networkInfo);
  });

  test('Should return Return success if there is network connectivity',
      () async {
    //Arrange
    const params = GetPhotosParams(page: 1);
    cut.getPhotos(params);

    when(() async => await networkInfo.isConnected)
        .thenAnswer((_) async => true);

    //Act
    when(() => service.getPhotos(params)).thenAnswer((_) async => []);
  });
}
