import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:store_app/UI/Colors/customColors.dart';
import 'package:store_app/Controller/productController.dart';
import 'package:store_app/Widgets/productTile.dart';

import '../../Models/productModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put<ProductController>(ProductController());

    List<ProductModel> productList = controller.productList;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SoulStore",
          style: TextStyle(
              letterSpacing: 5,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: CustomColors().textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => controller.isLoading.value == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.all(10),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductTileContent(
                          image: productList[index].images![0].toString(),
                          title: controller.productList[index].title.toString(),
                          price:
                              '\$${controller.productList[index].price.toString()}',
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2),
                    ))),
          ),
        ],
      ),
    );
  }
}
