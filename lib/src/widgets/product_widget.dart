import 'package:flutter/cupertino.dart';
import 'package:laffyuu/src/model/product_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductResult data;

  const ProductWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          children: [
      Image.network(data.images.image),
      Text(data.name),
      Text(data.price.toString()),
      Text(data.discountPrice.toString())
      ],
    ),);
  }
}
