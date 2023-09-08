import 'package:ecom_2/app/components/admin_product_card.dart';
import 'package:ecom_2/app/components/product_card.dart';
import 'package:ecom_2/app/model/product.dart';
import 'package:ecom_2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: SearchView(), query: 'red');
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.categories == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    // TextField(
                    //   decoration: InputDecoration(border: OutlineInputBorder()),
                    //   // onChanged: (v) {
                    //   //   showSearch(
                    //   //       context: context, delegate: SearchView(), query: v);
                    //   // },
                    //   onSubmitted: (v) {
                    //     showSearch(
                    //         context: context, delegate: SearchView(), query: v);
                    //   },
                    // ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categories?.length ?? 0,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_CATEGORY,
                                    arguments: controller.categories?[index]);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(200)),
                                child: Center(
                                  child: Text(
                                    controller
                                            .categories?[index].categoryTitle ??
                                        '',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    controller.products == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.products?.length ?? 0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) => SizedBox(
                                width: 200,
                                child: ProductCard(
                                    product: controller.products![index])))
                  ],
                ),
              ),
            );
          },
        ));
  }
}

HomeController controller = Get.find();

class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: const Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> suggestions = [];
    suggestions = controller.products
            ?.where((element) =>
                element.title?.toLowerCase().contains(query.toLowerCase()) ??
                false)
            .toList() ??
        [];

    return ListView.builder(
        shrinkWrap: true,
        itemCount: suggestions.length,
        itemBuilder: (context, index) => SizedBox(
              height: 100,
              child: AdminProductCard(product: suggestions[index]),
            ));
  }
}
