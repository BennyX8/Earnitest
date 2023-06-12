import 'package:earnitest/features/gallery/domain/entities/photo.dart';
import 'package:earnitest/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/empty_list_widget.dart';
import '../bloc/gallery_bloc.dart';
import '../widgets/gallery_view.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  static const String route = '/gallery';

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final galleryBloc = sl<GalleryBloc>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Photo> photos = [];

  @override
  void initState() {
    galleryBloc.add(const GetPhotosEvent(page: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Photo Splash'),
        leading: InkWell(
          onTap: () {
            final state = scaffoldKey.currentState!;
            state.isDrawerOpen ? state.closeDrawer() : state.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/images/slick_menu.png',
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
      drawer: Container(
        width: 300,
        color: Colors.white,
      ),
      body: RefreshIndicator(
        strokeWidth: 1,
        onRefresh: () async {
          galleryBloc.add(const GetPhotosEvent(page: 1));
        },
        child: BlocProvider(
          create: (context) => galleryBloc,
          child: BlocBuilder<GalleryBloc, GalleryState>(
            builder: (context, state) {
              if (state is GetPhotosLoaded) {
                return GalleryView(
                  photos: state.photos,
                );
              } else if (state is GetPhotosError) {
                return Center(
                  child: EmptyListWidget(
                    text: state.failure.message,
                    onRefresh: () => galleryBloc.add(
                      const GetPhotosEvent(page: 1),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: SizedBox(
                    width: 40,
                    height: 1,
                    child: LinearProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
