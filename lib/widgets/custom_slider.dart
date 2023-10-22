import 'package:ecommerce_app_design/models/product_model.dart';
import 'package:ecommerce_app_design/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<ProductModel> list = Provider.of<ProductProvider>(context, listen: false).getProducts;
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.5,
          child: PageView(
            onPageChanged: (page) => setState(() => index = page),
            children: [
              for(int i = 0; i < 4; i++)
                Container(
                  color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width/2.5,
                              child: Text(
                                list[i].title!,
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/2.5,
                              child: Text(
                                list[i].description!,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: const Color(0xff666666),
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            ElevatedButton(
                              onPressed: (){},
                              child: const Text('Shop now'),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.network(list[i].images![0],
                          width: 160.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          bottom: 20.0,
          left: 16.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 0; i < 4; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: i == index ? const Color(0xff333333) : const Color(0xffC6C6C6),
                    ),
                    height: 6.0,
                    width: 6.0,
                    child: const SizedBox.expand(),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
