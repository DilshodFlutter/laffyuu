import 'package:flutter/cupertino.dart';
import 'package:laffyuu/src/model/rec_product_model.dart';

class RecProductWidget extends StatelessWidget {
  final RecProductResult data2;

  const RecProductWidget({Key? key, required this.data2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(data2.image),
      ],
    );
  }
}
