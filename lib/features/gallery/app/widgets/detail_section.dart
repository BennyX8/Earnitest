import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/photo.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({
    super.key,
    required this.photo,
    required this.height,
    this.textLines,
  });

  final Photo photo;
  final double height;
  final int? textLines;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black,
              Colors.black.withOpacity(0.8),
              Colors.transparent
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: textLines != null && textLines! > 1
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 13.0,
              backgroundImage: FastCachedImageProvider(
                photo.user.profileImage.small,
              ),
            ),

            //* Horizontal Spacer
            const SizedBox(width: 6.0),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    photo.user.name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 11.0,
                    ),
                  ),
                  photo.description.isNotEmpty
                      ? Text(
                          photo.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: textLines ?? 1,
                          style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: 9.0,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
