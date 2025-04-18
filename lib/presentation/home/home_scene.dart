import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/routing/routes.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/model/photo_info.dart';
import 'package:image_search_app/presentation/home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    print('hohoho');
  }

  @override
  void dispose() {
    super.dispose();
    print("dhodhodhdohdohdohd");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, snapshot) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Search',
                    ),
                    onSubmitted: (query) {
                      widget.viewModel.getPhotoInfo(query);
                    },
                  ),

                  SizedBox(height: 20,),

                  Expanded(
                    child: GridView.builder(
                      itemCount: widget.viewModel.state.photoInfo?.hits.length ?? 0,

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.0,
                      ),

                      itemBuilder: (context, index) {
                        final List<Photo> photos = widget.viewModel.state.photoInfo?.hits ?? [];

                        return GestureDetector(
                          onTap: () {
                            context.push(Routes.detail, extra: photos[index]);
                          },
                          child: Image.network(
                            photos[index].previewURL,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

