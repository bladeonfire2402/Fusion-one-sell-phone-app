import 'package:flutter/material.dart';
import 'package:haha/controller/My_Valiator_controller.dart';

class EditUploadProduct extends StatefulWidget {
  const EditUploadProduct({super.key});

  @override
  State<EditUploadProduct> createState() => _EditUploadProductState();
}

class _EditUploadProductState extends State<EditUploadProduct> {
  final _formkey = GlobalKey<FormState>();

  late TextEditingController _titleController,
      _priceController,
      _descriptionController,
      _quantityController;

  @override
  void initState() {
    _titleController = TextEditingController(text: "");
    _priceController = TextEditingController(text: "");
    _descriptionController = TextEditingController(text: "");
    _quantityController = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void clearForm() {
    _titleController.clear();
    _priceController.clear();
    _descriptionController.clear();
    _quantityController.clear();
  }

  Future<void> _uploadProduct() async {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        bottomSheet: SizedBox(
          height: kBottomNavigationBarHeight + 10,
          child: Material(
            color: Colors.black87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: clearForm,
                  icon: Icon(Icons.clear),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  label: Text("Dọn ngay"),
                ),
                ElevatedButton.icon(
                  onPressed: _uploadProduct,
                  icon: Icon(Icons.update),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  label: Text("Tải sản phẩm lên"),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text("Tạo sản phẩm mới"),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _titleController,
                          key: const ValueKey('Title'),
                          maxLength: 80,
                          minLines: 1,
                          maxLines: 2,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            hintText: 'Product Title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            return MyValidators.uploadProdTexts(
                              value: value,
                              toBeReturnedString: "Nhập tên sản phẩm phù hợp",
                            );
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _titleController,
                                key: const ValueKey('Title'),
                                maxLength: 20,
                                minLines: 1,
                                maxLines: 2,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                decoration: InputDecoration(
                                  hintText: 'Product Title',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                validator: (value) {
                                  return MyValidators.uploadProdTexts(
                                    value: value,
                                    toBeReturnedString:
                                        "Nhập tên sản phẩm phù hợp",
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
