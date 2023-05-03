import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopping/providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-products';
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _pricefocusNode = FocusNode();
  final _descfocusnode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: '',
    title: '',
    description: '',
    imageUrl: '',
    price: 0.0,
  );
  @override
  void dispose() {
    // TODO: implement dispose
    _pricefocusNode.dispose();
    _descfocusnode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveform() {
    _form.currentState!.save();
    print(_editedProduct.id);
    print(_editedProduct.description);
    print(_editedProduct.imageUrl);
    print(_editedProduct.title);
    print(_editedProduct.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(onPressed: _saveform, icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_pricefocusNode);
              },
              onSaved: (value) {
                _editedProduct = Product(
                    id: _editedProduct.id,
                    title: value!,
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Price'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: _pricefocusNode,
              onSaved: (value) {
                _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    price: double.parse(value!),
                    imageUrl: _editedProduct.imageUrl);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              focusNode: _descfocusnode,
              onSaved: (value) {
                _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    description: value!,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl);
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 8, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: _imageUrlController.text.isEmpty
                      ? const Text('Please enter the Image URL')
                      : FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(_imageUrlController.text),
                        ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Image URL'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: _imageUrlController,
                    onFieldSubmitted: (_) => {_saveform()},
                    onSaved: (value) {
                      _editedProduct = Product(
                          id: _editedProduct.id,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl: value!);
                    },
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
