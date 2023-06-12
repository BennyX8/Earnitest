import 'package:earnitest/core/dependencies/earni_route.dart';
import 'package:earnitest/features/gallery/app/bloc/gallery_bloc.dart';
import 'package:earnitest/features/gallery/app/pages/photo_detail_view.dart';
import 'package:earnitest/features/gallery/domain/entities/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../injection_container.dart';
import 'loading_more.dart';
import 'photo_card.dart';

class GalleryView extends StatefulWidget {
  final List<Photo> photos;

  const GalleryView({
    super.key,
    required this.photos,
  });

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView>
    with SingleTickerProviderStateMixin {
  final loadMoreBloc = sl<GalleryBloc>();
  final _scrollController = ScrollController();
  late AnimationController _animationController;

  List<Photo> photos = [];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    photos = widget.photos;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GalleryBloc, GalleryState>(
      bloc: loadMoreBloc,
      listener: (context, state) {
        if (state is GetPhotosLoading) {
          _animationController.forward();
        } else if (state is GetPhotosLoaded) {
          setState(() {
            photos = state.photos;
          });

          Future.delayed(const Duration(milliseconds: 1000), () {
            _animationController.reverse();
          });
        } else {
          Future.delayed(const Duration(milliseconds: 1000), () {
            _animationController.reverse();
          });
          //Show error
        }
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: _notificationHandler,
        child: Column(
          children: [
            Expanded(
              child: MasonryGridView.builder(
                itemCount: photos.length,
                controller: _scrollController,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => PhotoCard(
                  photo: photos[index],
                  onTap: (p0) async {
                    await Navigator.push(
                      context,
                      EarniPayRoute(
                        child: PhotoDetailView(
                          photo: p0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizeTransition(
              sizeFactor: _animationController.drive(Tween(begin: 0, end: 1)),
              child: const LoadingMoreView(),
            ),
          ],
        ),
      ),
    );
  }

  bool _notificationHandler(notification) {
  //Check to verify that type of scroll notification is 
  //ScrollEnd and that widgets below the viewport is 0
    if (notification is ScrollEndNotification &&
        notification.metrics.extentAfter == 0.0) {
      loadMoreBloc.add(GetMorePhotosEvent());
    }

    return true;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
