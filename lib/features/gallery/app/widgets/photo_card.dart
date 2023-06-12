import 'package:earnitest/features/gallery/domain/entities/photo.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

import 'detail_section.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;
  final void Function(Photo) onTap;

  const PhotoCard({super.key, required this.photo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(photo),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              FastCachedImage(
                url: photo.urls.thumb,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.grey,
                ),
                loadingBuilder: (context, p1) => Container(
                    height: 140.0,
                    color: Colors.grey.shade200,
                    child: Align(
                      child: SizedBox(
                        width: 40,
                        height: 2,
                        child: LinearProgressIndicator(
                          value: p1.totalBytes != null
                              ? p1.downloadedBytes / p1.totalBytes!
                              : null,
                        ),
                      ),
                    ),
                  ),
              ),

              //Little description at the bottom of each
              //image card or page
              DetailSection(photo: photo, height: 50.0)
            ],
          ),
        ),
      ),
    );
  }
}
