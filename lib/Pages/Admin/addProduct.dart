import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mark_shop/provider/modelHub.dart';
import 'package:provider/provider.dart';

import '../../Constance/custm_textfeild.dart';
import '../../Models/product.dart';
import '../../serveses/store.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? name, description, prise, location, imageLocation, category;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Store firestoreObj = Store();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlurryModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        blurEffectIntensity: 5,
        child: Center(child: Builder(builder: (context) {
          return Form(
            key: _globalKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustemTextFeild(
                    isPassword: false,
                    onClick: (val) {
                      name = val;
                    },
                    hint: 'product name ',
                  ),
                  CustemTextFeild(
                    isPassword: false,
                    onClick: (val) {
                      prise = val;
                    },
                    hint: 'product prise ',
                  ),
                  CustemTextFeild(
                    isPassword: false,
                    onClick: (val) {
                      description = val;
                    },
                    hint: 'product description ',
                  ),
                  CustemTextFeild(
                    isPassword: false,
                    onClick: (val) {
                      category = val;
                    },
                    hint: 'product category ',
                  ),
                  CustemTextFeild(
                    isPassword: false,
                    onClick: (val) {
                      location = val;
                    },
                    hint: 'product location',
                  ),
                  CustemTextFeild(
                    isPassword: false,
                    onClick: (val) {
                      imageLocation = val;
                    },
                    hint: 'product image url',
                  ),
                  OutlinedButton(
                    child: Text('add product now'),
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      final _modelHud =
                          Provider.of<ModelHud>(context, listen: false);
                      _modelHud.cahngeLoading(true);
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();
                        try {
                          await firestoreObj.addProduct(Product(
                              name: name.toString(),
                              description: description.toString(),
                              img: imageLocation.toString(),
                              location: location.toString(),
                              prise: prise.toString(),
                              category: category.toString()));
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Product Added')));

                          _modelHud.cahngeLoading(false);
                          print(_modelHud.isLoading.toString() +
                              '------------------------');
                          _globalKey.currentState!.reset();
                        } on PlatformException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Error' + e.message.toString())));
                          _modelHud.cahngeLoading(false);
                        }

                        //save to database
                        //try{}catch(e){}
                      } else {
                        _modelHud.cahngeLoading(false);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('اكمل المطلوب')));
                      }
                    },
                  )
                ],
              ),
            ),
          );
        })),
      ),
    ));
  }
}
