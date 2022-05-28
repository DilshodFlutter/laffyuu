import 'package:flutter/cupertino.dart';
import 'package:laffyuu/src/model/super_flash_model.dart';

class SuperFlashWidget extends StatelessWidget {
  final SuperFlashModel data;

  const SuperFlashWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 206,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.results.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(16.0),
              child: Stack(
                children: [Image.network(data.results[index].image)],
              ),
            );
          }),
    );
  }
}
