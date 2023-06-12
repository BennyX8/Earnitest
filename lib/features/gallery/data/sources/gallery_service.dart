import 'dart:convert';

import 'package:earnitest/core/apis/api_endpoints.dart';
import 'package:earnitest/core/apis/request_headers.dart';
import 'package:earnitest/core/helpers/helpers.dart';
import 'package:earnitest/features/gallery/data/models/photo_model.dart';
import 'package:earnitest/features/gallery/domain/usecases/get_photos.dart';
import 'package:http/http.dart' as http;

abstract class GalleryService {
  Future<List<PhotoModel>> getPhotos(GetPhotosParams params);
}

class GalleryServiceImpl implements GalleryService {
  final http.Client client;


  GalleryServiceImpl(this.client);

  @override
  Future<List<PhotoModel>> getPhotos(GetPhotosParams params) async {
    //Get Provided Params
    final parameters = params.toParams;

    pp('$photoUrl$parameters');

    //Trigger http Get reguest to get data
    final response = await client.get(
      Uri.parse('$photoUrl$parameters'),
      headers: headers,
    );

    //Verify that request was success
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List<PhotoModel> photos = [];

      for (final item in data) {
        photos.add(PhotoModel.fromMap(item));
      }

      return photos;
    } else {
      final error =
          json.decode(response.body)?['errors']?[0] ?? 'Unknown error';
      throw Exception(error);
    }
    //Wait and verify that the returned data is a valid json response
    //Model the received data and return SystemData
  }
}
