import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../cubit/add_restaurant/add_product_cubit.dart';
import '../../cubit/google_map/google_map_cubit.dart';
import '../../data/datasource/local_datasource/auth_local.dart';
import '../../data/datasource/remote_datasource/product_datasource.dart';
import '../../data/models/requests/add_product/add_product_request_model.dart';
import '../../routes/app_pages.dart';
import '../widgets/text_form_global.dart';

class AddRestaurantPage extends StatefulWidget {
  const AddRestaurantPage({super.key});

  @override
  State<AddRestaurantPage> createState() => _AddRestaurantPageState();
}

class _AddRestaurantPageState extends State<AddRestaurantPage> {
  TextEditingController? name;
  TextEditingController? description;
  TextEditingController? address;
  String lat = "";
  String lang = "";
  XFile? picture;

  Future<void> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(
      source: source,
      imageQuality: 50,
    );

    if (photo != null) {
      picture = photo;
      setState(() {});
    }
  }

  @override
  void initState() {
    name = TextEditingController();
    description = TextEditingController();
    address = TextEditingController();
    context.read<GoogleMapCubit>().getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    name?.dispose();
    description?.dispose();
    address?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: Colors.amber[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              picture != null
                  ? GestureDetector(
                      onTap: () {
                        getImage(ImageSource.gallery);
                      },
                      child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.file(File(picture!.path))),
                    )
                  : SizedBox(
                      height: 200,
                      width: 200,
                      child: IconButton(
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          icon: const Icon(
                            Icons.image,
                            size: 100,
                          )),
                    ),

              const SizedBox(height: 16),
              TextFormGlobal(
                  control: name!,
                  inputType: TextInputType.text,
                  icon: Icons.restaurant_menu,
                  label: "Name Restaurant"),
              const SizedBox(height: 16),
              TextFormGlobal(
                  control: description!,
                  inputType: TextInputType.text,
                  icon: Icons.description,
                  label: "Description Restaurant"),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.77,
                    child: BlocBuilder<GoogleMapCubit, GoogleMapState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return AbsorbPointer(
                              absorbing: true,
                              child: TextFormGlobal(
                                  control: address!,
                                  inputType: TextInputType.text,
                                  icon: Icons.map,
                                  label: "Address Restaurant"),
                            );
                          },
                          loaded: (model) {
                            address!.text = model.address!;
                            lat = model.latLng!.latitude.toString();
                            lang = model.latLng!.longitude.toString();
                            return AbsorbPointer(
                              absorbing: false,
                              child: TextFormGlobal(
                                  control: address!,
                                  inputType: TextInputType.text,
                                  icon: Icons.map,
                                  label: "Address Restaurant"),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.amber[900]),
                    child: BlocBuilder<GoogleMapCubit, GoogleMapState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          loaded: (model) {
                            return IconButton(
                                onPressed: () {
                                  context.push(Routes.gmap, extra: model);
                                },
                                icon: const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ));
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              // picture != null
              //     ? Image.file(
              //         XFile(picture!.path),
              //         height: 200,
              //         width: 200,
              //       )
              //     : const SizedBox(),
              // const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[900]),
                  onPressed: () async {
                    final image =
                        await ProductDataSource().uploadImage(picture!);
                    image.fold((l) {
                      debugPrint(l);
                      return;
                    }, (r) async {
                      final userId = await AuthLocal.getUserId();
                      final data = AddProductRequestModel(
                          data: Data(
                              name: name!.text,
                              description: description!.text,
                              latitude: lat,
                              longitude: lang,
                              photo: "http://103.150.116.14:1337${r.url}",
                              address: address!.text,
                              userId: userId));
                      debugPrint(data.data.toJson().toString());
                      if (context.mounted) {
                        context.read<AddProductCubit>().add(data);
                      }
                    });
                  },
                  child: BlocConsumer<AddProductCubit, AddProductState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        loaded: (model) => context.push(Routes.main),
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const Text('Add Product');
                        },
                        loading: () => const CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
