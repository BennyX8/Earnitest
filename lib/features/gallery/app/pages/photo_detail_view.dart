import 'package:earnitest/core/widgets/empty_list_widget.dart';
import 'package:earnitest/features/gallery/app/widgets/detail_section.dart';
import 'package:earnitest/features/gallery/domain/entities/photo.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoDetailView extends StatefulWidget {
  final Photo photo;

  const PhotoDetailView({super.key, required this.photo});

  @override
  State<PhotoDetailView> createState() => _PhotoDetailViewState();
}

class _PhotoDetailViewState extends State<PhotoDetailView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey, size: 24.0),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
          ),
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FastCachedImage(
                url: widget.photo.urls.small,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Builder(builder: (context) {
            return Stack(
              fit: StackFit.expand,
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  // alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FastCachedImage(
                      url: widget.photo.urls.full,
                      loadingBuilder: (p0, p1) {
                        if (!p1.isDownloading) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }

                        return Center(
                          child: SizedBox(
                            width: 40,
                            height: 2,
                            child: LinearProgressIndicator(
                              value: p1.totalBytes != null
                                  ? p1.downloadedBytes / p1.totalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: EmptyListWidget(
                          text: '$error',
                          icon: Icons.warning_amber_rounded,
                          onRefresh: null,
                        ),
                      ),
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _animationController.drive(
                    Tween(begin: 0, end: 1),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: DetailSection(
                      photo: widget.photo,
                      height: 100.0,
                      textLines: 3,
                    ),
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
