import 'package:dartz/dartz.dart';
import 'package:earnitest/features/gallery/domain/repository/gallery_repository.dart';
import 'package:earnitest/features/gallery/domain/usecases/get_photos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock_data/test_photo_object.dart';

class MockGalleryRepository extends Mock implements GalleryRepository {}

void main() {
  late GetPhotos testObject;
  late MockGalleryRepository mockRepo;

  setUp(() {
    mockRepo = MockGalleryRepository();
    testObject = GetPhotos(mockRepo);
  });

  const testParam = GetPhotosParams(page: 1);

  test('Get Photos Usecase Test', () async {
    when(mockRepo.getPhotos(const GetPhotosParams(page: 1)))
        .thenAnswer((_) async =>  Right([testPhoto]));

    final realResult = await testObject.call(testParam);

    expect(realResult,  Right([testPhoto]));
    verify(mockRepo.getPhotos(const GetPhotosParams(page: 1)));
  });
}
