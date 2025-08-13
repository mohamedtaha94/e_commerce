// ignore_for_file: avoid_print

/*
import 'package:e_commerce/common/bloc/product/products_display_cubit.dart';
import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce/common/widgets/product/product_card.dart';
import 'package:e_commerce/domain/category/entity/category.dart';
import 'package:e_commerce/domain/product/usecases/get_products_by_category_id.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/product/products_display_state.dart';
import '../../../domain/product/entities/product.dart';

class CategoryProductsPage extends StatelessWidget {
  
  final CategoryEntity categoryEntity;
  const CategoryProductsPage({
    required this.categoryEntity,
    super.key});

  @override
  Widget build(BuildContext context) {
    print('Category ID: ${categoryEntity.categoryId}');
print('Category Title: ${categoryEntity.title}');
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => ProductsDisplayCubit(useCase: sl<GetProductsByCategoryIdUseCase>())..displayProducts(params: categoryEntity.categoryId),
        child: BlocBuilder<ProductsDisplayCubit,ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading){
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _categoryInfo(state.products),
                    const SizedBox(height: 10,),
                     _products(state.products)
                  ],
                ),
              );
            }
            return Container();
          },
        )
      ) ,
    );
  }

  Widget _categoryInfo(List<ProductEntity> products) {
    return Text(
      '${categoryEntity.title} (${products.length})',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6
          ),
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(productEntity: products[index]);
          },
      ),
    );
  }
}*/
import 'package:e_commerce/common/bloc/product/products_display_cubit.dart';
import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce/common/widgets/product/product_card.dart';
import 'package:e_commerce/domain/category/entity/category.dart';
import 'package:e_commerce/domain/product/usecases/get_products_by_category_id.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/product/products_display_state.dart';
import '../../../domain/product/entities/product.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryProductsPage({
    required this.categoryEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('Category ID: ${categoryEntity.categoryId}');
    print('Category Title: ${categoryEntity.title}');

    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => ProductsDisplayCubit(
          useCase: sl<GetProductsByCategoryIdUseCase>(),
        )..displayProducts(params: categoryEntity.categoryId.toLowerCase().trim()),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductsLoaded) {
              final products = state.products;

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _categoryInfo(products),
                    const SizedBox(height: 10),
                    products.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text(
                                "No products found",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          )
                        : Expanded(child: _products(products)),
                  ],
                ),
              );
            }

            return const Center(child: Text("Something went wrong"));
          },
        ),
      ),
    );
  }

  Widget _categoryInfo(List<ProductEntity> products) {
    return Text(
      '${categoryEntity.title} (${products.length})',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(productEntity: products[index]);
      },
    );
  }
}
