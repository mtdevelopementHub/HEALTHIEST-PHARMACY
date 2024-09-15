import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_edit_medicine.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/seller_get_medicines.dart';

class EditSellerMedicineForm extends StatelessWidget {
  EditSellerMedicineForm({super.key});
//controller instnce hhy data get k  lia
  final SellerEditMedicineFormController sellerEditMedicineFormController =
      Get.put(SellerEditMedicineFormController());

  @override
  Widget build(BuildContext context) {
    final medicine_category = Get.arguments['medicine_category'];

    return GetBuilder(
        init: SellerEditMedicineFormController(),
        builder: (value) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green.shade300,
              title: Text('Update Medicine Form'),
            ),
            body: Padding( 
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                //name field hy 
                    TextFormField(
                      controller: sellerEditMedicineFormController.nameController,
                      decoration: InputDecoration(
                        labelText: 'Name:',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                //dosage field
                    TextFormField(
                      controller: sellerEditMedicineFormController.dosageController,
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
                      controller: sellerEditMedicineFormController.priceController,
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
                          sellerEditMedicineFormController.formulaController,
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
                          sellerEditMedicineFormController.quantityController,
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
                          sellerEditMedicineFormController.descriptionController,
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
                      value: sellerEditMedicineFormController.selectedItem1,
                      onChanged: (String? newValue) {
                        sellerEditMedicineFormController.selectedItem1 =
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
                    // if (sellerEditMedicineFormController.image != null)
                    //   Image.file(
                    //     sellerEditMedicineFormController.image!,
                    //     height: 100,
                    //   ),

                            sellerEditMedicineFormController.image == null
                        ?    sellerEditMedicineFormController.imageW == null ?  SizedBox() : Image.network(
                            "https://pharmacy.alruya.link${sellerEditMedicineFormController.imageW.toString()}",
                            height: 100,
                          )
                        : Image.file(
                            sellerEditMedicineFormController.image!,
                            height: 100,
                          ),


                   
                      // image get button
                    ElevatedButton(
                      onPressed: sellerEditMedicineFormController.getImage,
                      child: Text('Pick Image'),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  //or ya sumbit button hy
                    ElevatedButton(
                      onPressed: ()async{
                      //  FocusScope.of(context).unfocus();
                      await sellerEditMedicineFormController.updateMedicine();
                        
                     await   Get.find<SellerGetMedicineController>().getMedicine();
                //     sellerMedicineFormController.isClear();
                      // Get.to(GetMedicineScreen());
                       Get.back();
                      ;
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
