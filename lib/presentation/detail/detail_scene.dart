import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app/presentation/detail/detail_view_model.dart';

class DetailScreen extends StatefulWidget {
  final DetailViewModel viewModel;

  const DetailScreen({super.key, required this.viewModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final photo = widget.viewModel.state.photo;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(onTap: () {
                context.pop();
              }, child: Icon(Icons.arrow_back, size: 24,)),

              SizedBox(height: 20,),

              Image.network(
                width: double.infinity,
                photo.previewURL,
                fit: BoxFit.cover,
              ),

              SizedBox(height: 24,),

              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('tag: ${photo.tags}'),
                    SizedBox(height: 10,),
                    Text('user name: ${photo.user}')
                  ],
                )
              ),

            ],
          ),
        ),
      ),
    );
  }
}


