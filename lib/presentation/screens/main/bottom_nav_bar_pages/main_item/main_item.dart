import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seven_food/data/cubit/show_cases_cubit/showcases_cubit.dart';
import 'package:seven_food/data/models/showcases/showcases.dart';
import 'package:seven_food/presentation/custom_icons/bottom_nav_icons.dart';
import 'package:seven_food/presentation/screens/login/login_screen.dart';
import 'package:seven_food/presentation/screens/main/bottom_nav_bar_pages/main_item/products_menu_page.dart';
import 'package:seven_food/presentation/screens/main/bottom_nav_bar_pages/qr_item/qr_camera_page.dart';
import 'package:seven_food/presentation/widgets/list_tile_showcase.dart';
import 'package:seven_food/utils/colors.dart';
import 'package:seven_food/utils/utils.dart';

class MainItem extends StatefulWidget {
  static String mapStyle = '''
  [
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
]
  ''';
  const MainItem({Key? key}) : super(key: key);

  @override
  _MainItemState createState() => _MainItemState();
}

class _MainItemState extends State<MainItem>  with SingleTickerProviderStateMixin {
  bool isList = true;
  final Set<Marker> _markers = HashSet<Marker>();
  late BitmapDescriptor descriptor;
  late AnimationController animationController;
  Future<void> _setMarkerIcon() async {
    descriptor = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(25, 25)), "images/marker1.png",);
  }

  @override
  void initState() {
    super.initState();
    animationController = BottomSheet.createAnimationController(this);
    animationController.duration = const Duration(milliseconds: 300);
    animationController.reverseDuration = const Duration(milliseconds: 300);
    BlocProvider.of<ShowcasesCubit>(context).getShowcases();
    _setMarkerIcon();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowcasesCubit, ShowcasesState>(
      listener: (BuildContext context, state) {
        if (state is ShowcasesStateError) {
          buildShowError(context, state.message);
        }
      },
      builder: (BuildContext context, Object? state) {
        if (state is ShowcasesStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ShowcasesStateLoaded) {
          return buildStack(context, state.showcases);
        }
        return Container();
      },
    );
  }


  Stack buildStack(BuildContext context, List<Showcases> showcases) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        if (isList)
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsMenuPage(showcase: showcases[index])));
                          },
                          child:  Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ListTileShowcase(
                              titleStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              color: contentBackground,
                              subtitle: "${showcases[index].address}",
                              id: "${showcases[index].id}",
                              shapeBorder: RoundedRectangleBorder(
                              borderRadius: index == 0
                                  ? const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),)
                                  : index == showcases.length - 1
                                  ? const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )
                                  : BorderRadius.zero,
                            ),),
                          ),
                        );
                      },
                      itemCount: showcases.length,
                    ),
                  ),
                ),
              ),
            ],
          )
        else
          Positioned(
            child: GoogleMap(
              markers: _markers,
              onMapCreated: (controller) {
                controller.setMapStyle(MainItem.mapStyle);
                for (final Showcases sh in showcases) {
                  _markers.add(
                    Marker(
                      onTap: (){
                        showModalBottomSheet(
                            transitionAnimationController: animationController,
                            isScrollControlled: true,
                            context: context, builder: (context) =>  SingleChildScrollView(
                            child:Container(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                child:  Container(
                                  color: const Color(0xff757575),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 120),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0x12041538),
                                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                              ),
                                              height: 5,
                                            ),
                                          ),
                                          ListTileShowcase(titleStyle: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "ManropeBold",
                                          ),id: "№${sh.id}", subtitle: sh.address!,color: Colors.white,),

                                          Row(
                                            children: [
                                              MaterialButton(onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsMenuPage(showcase: sh)));
                                              },
                                                color: const Color(0x12041538),
                                                elevation: 0,
                                              height: 56,
                                              minWidth: 56,
                                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                                child: const Center(
                                                  child: Icon(BottomNavIcons.scan,color: Colors.black,size: 20,),
                                                ),
                                              ),
                                              const SizedBox(width: 5,),
                                              Expanded(child:
                                              MaterialButton(
                                                disabledColor: blueForButtonDisabled ,
                                                color: blueForButton,
                                                elevation: 5,
                                                height: 56,
                                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                                onPressed: (){
                                                  Navigator.pushNamed(context, QrCameraPage.id);
                                                },
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: const [
                                                      Icon(BottomNavIcons.basket,color: Colors.white,size: 24,),
                                                      Text("Открыть",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 1))
                                                    ],
                                                  ),
                                                ),),)
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          )
                                        ],
                                      ),
                                    ),
                                    ),
                                  ),
                                ),
                            ),
                        );
                      },
                      icon: descriptor,
                      markerId: MarkerId("${sh.id}"),
                      position: LatLng(
                        double.parse(sh.latitude!),
                        double.parse(sh.longitude!),
                      ),
                    ),
                  );
                }
                setState(() {});
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(
                  43.2375395,
                  76.9082048,
                ),
                zoom: 15,
              ),
            ),
          ),
        Positioned(
          left: 80,
          right: 80,
          top: 50,
          child: Container(
            alignment: AlignmentDirectional.center,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xffdddddd),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: MaterialButton(
                        elevation: 5,
                        onPressed: () {
                          isList = !isList;
                          setState(() {});
                        },
                        color: isList ? Colors.white : null,
                        child: const Text("Списком"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: MaterialButton(
                        elevation: 5,
                        onPressed: () {
                          isList = !isList;
                          setState(() {});
                        },
                        color: !isList ? Colors.white : null,
                        child: const Text("На карте"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
