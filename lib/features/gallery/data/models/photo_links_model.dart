// ignore_for_file: overridden_fields, annotate_overrides

import '../../domain/entities/photo_links.dart';

class PhotoLinksModel extends PhotoLinks {
  final String self;
  final String html;
  final String download;
  final String downloadLocation;

  const PhotoLinksModel({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  }) : super(
          self: self,
          html: html,
          download: download,
          downloadLocation: downloadLocation,
        );

  factory PhotoLinksModel.fromMap(Map<String, dynamic> data) {
    return PhotoLinksModel(
      self: data['self'],
      html: data['html'],
      download: data['download'],
      downloadLocation: data['download_location'],
    );
  }
}
