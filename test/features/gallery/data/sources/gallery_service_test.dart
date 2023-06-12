import 'package:earnitest/core/apis/request_headers.dart';
import 'package:earnitest/features/gallery/data/sources/gallery_service.dart';
import 'package:earnitest/features/gallery/domain/usecases/get_photos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late GalleryServiceImpl sut;
  late GetPhotosParams params;
  late MockClient client;

  const photoUrl = 'https://api.unsplash.com/photos';

  setUp(() {
    //Arrange
    params = const GetPhotosParams(page: 1);
    client = MockClient();

    sut = GalleryServiceImpl(client);
  });

  test(
    "Check that the expected params are correct",
    () async {
      expect(params, const GetPhotosParams(page: 1));
    },
  );

  test(
    "Verify that http get was called once",
    () async {
      final uri = Uri.parse('$photoUrl${params.toParams}');

      when(() => client.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response('[]', 200));

      sut.getPhotos(params);

      verify(() => client.get(uri, headers: headers)).called(1);
    },
  );
}
