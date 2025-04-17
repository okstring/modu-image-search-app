import 'package:flutter/material.dart';
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
    return const Placeholder();
  }
}


