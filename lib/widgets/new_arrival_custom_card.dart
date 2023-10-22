import 'package:ecommerce_app_design/models/product_model.dart';
import 'package:flutter/material.dart';

class NewArrivalCustomCard extends StatelessWidget {
  const NewArrivalCustomCard({super.key, required this.onTap, required this.item,});
  final VoidCallback onTap;
  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          width: 150.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)
            ),
          ),
          child: Card(
            elevation: 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(
                    child: Image.network(item.images![0],
                      //height: 80.0,
                      width: 80.0,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
                //   child: Text(item.category!.name!,
                //     style: Theme.of(context).textTheme.titleSmall,
                //     textAlign: TextAlign.left,
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(item.title!,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(item.description!,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text('\$${item.price!}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(
                            Icons.add_box
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
