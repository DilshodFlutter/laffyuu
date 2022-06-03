import 'package:flutter/cupertino.dart';
import 'package:laffyuu/src/model/product_model.dart';

class ProductGridWidget extends StatelessWidget {
  final ProductResult data;

  const ProductGridWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [

        ],
      ),
    );
  }
}
