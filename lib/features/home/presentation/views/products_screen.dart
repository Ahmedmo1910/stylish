import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/cubits/products_cubit/products_cubit.dart';
import 'package:stylish/core/repos/products_repo/products_repo.dart';
import 'package:stylish/core/services/get_it_service.dart';
import 'package:stylish/features/home/presentation/views/widgets/products_screen_body.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductsRepo>(),
      ),
      child: const ProductsScreenBody(),
    );
  }
}
