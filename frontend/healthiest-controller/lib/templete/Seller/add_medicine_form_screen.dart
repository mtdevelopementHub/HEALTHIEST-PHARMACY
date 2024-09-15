import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_form_medicines.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/seller_get_medicines.dart';

class SellerMedicineForm extends StatelessWidget {
  SellerMedicineForm({super.key});
//controller instnce hhy data get k  lia
  final SellerMedicineFormController sellerMedicineFormController =
      Get.put(SellerMedicineFormController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SellerMedicineFormController(),
        builder: (value) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green.shade300,
              title: Text('Medicine Form'),
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                //name field hy 
                    TextFormField(
                      controller: sellerMedicineFormController.nameController,
                      decoration: InputDecoration(
                        labelText: 'Name:',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                //dosage field
                    TextFormField(
                      controller: sellerMedicineFormController.dosageController,
                      decoration: InputDecoration(
                        labelText: 'Dosage',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  //price field
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: sellerMedicineFormController.priceController,
                      decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    //formula field
                    TextFormField(
                      controller:
                          sellerMedicineFormController.formulaController,
                      decoration: InputDecoration(
                        labelText: 'Formula',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    //quantity field
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller:
                          sellerMedicineFormController.quantityController,
                      decoration: InputDecoration(
                        
                        labelText: 'Quantity',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),

                    SizedBox(height: 2.h,),
// description field
                      TextFormField(
                        maxLines: 5,
                      keyboardType: TextInputType.text,
                      controller:
                          sellerMedicineFormController.descriptionController,
                      decoration: InputDecoration(
                        
                        labelText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DropdownButton<String>(
                      value: sellerMedicineFormController.selectedItem1,
                      onChanged: (String? newValue) {
                        sellerMedicineFormController.selectedItem1 =
                            newValue!;
                    
                        String selectedValue = value.keyValueMap[newValue]!;
                    
                        value.tablet_id = selectedValue;
                    
                        value.selectTablet();
                        print('Selected Value: $selectedValue');
                      },
                      items: value.items
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    //status check box button hy
                    Column(
                      children: [
                        CheckboxListTile(
                          title: Text('Status'),
                          value: value.checkBoxValue,
                          onChanged: (newValue) {
                            value.checkBoxValue = newValue!;
                            value.selectCheckedBox();
                          },
                        ),
                        //isverified check box button hy
                           CheckboxListTile(
                          title: Text('Verified'),
                          value: value.isVerified,
                          onChanged: (newValue) {
                            value..isVerified = newValue!;
                            value.isVerif();
                          },
                        ),
                      ],
                    ),
                  
                    // TextFormField(
                    //   controller:
                    //       sellerMedicineFormController.imageUrlController,
                    //   decoration: InputDecoration(labelText: 'Image URL'),
                    // ),
                    SizedBox(height: 20),
                    if (sellerMedicineFormController.image != null)
                      Image.file(
                        sellerMedicineFormController.image!,
                        height: 100,
                      ),
                      // image get button
                    ElevatedButton(
                      onPressed: sellerMedicineFormController.getImage,
                      child: Text('Pick Image'),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  //or ya sumbit button hy
                    ElevatedButton(
                      onPressed: ()async{
                        FocusScope.of(context).unfocus();
                     await   sellerMedicineFormController.medicineData();
                        
                     await   Get.find<SellerGetMedicineController>().getMedicine();
                     sellerMedicineFormController.isClear();
                      // Get.to(GetMedicineScreen());
                       Get.back();
                       Get.back();
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
