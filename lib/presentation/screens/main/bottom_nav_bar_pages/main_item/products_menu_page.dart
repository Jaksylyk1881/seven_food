import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/cubit/products_cubit/products_cubit.dart';
import 'package:seven_food/data/models/showcases/showcases.dart';
import 'package:seven_food/utils/colors.dart';
import 'package:seven_food/utils/utils.dart';

class ProductsMenuPage extends StatefulWidget {
  final Showcases showcase;

  const ProductsMenuPage({Key? key, required this.showcase}) : super(key: key);

  @override
  _ProductsMenuPageState createState() => _ProductsMenuPageState();
}

class _ProductsMenuPageState extends State<ProductsMenuPage> {
  Showcases? showcases;

  @override
  void initState() {
    super.initState();
    showcases = widget.showcase;
    BlocProvider.of<ProductsCubit>(context).getProducts(showcases!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "Меню",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "№${showcases?.id}, ${showcases?.address}",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SafeArea(
          child: BlocConsumer<ProductsCubit, ProductsState>(
            listener: (BuildContext context, state) {
              if (state is ProductsStateError) {
                buildShowError(context, state.message);
              }
            },
            builder: (BuildContext context, Object? state) {
              if (state is ProductsStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductsStateLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    itemCount: state.products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 169.5 / 209,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: contentBackground,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Image.network(
                                    "${state.products[index].image}",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${state.products[index].price}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "ManropeBold",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 2, 16, 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${state.products[index].name}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "ManropeBold",
                                      ),
                                    ),
                                    Text(
                                      "${state.products[index].quantity}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "ManropeBold",
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
