import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_app_flutter/models/activity_model.dart';
import 'package:trips_app_flutter/provider/city_provider.dart';
import 'package:trips_app_flutter/views/activity_form/widgets/activity_form_image_picker.dart';

class ActivityForm extends StatefulWidget {
  final String cityName;

  const ActivityForm({super.key, required this.cityName});

  @override
  State<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Activity _newActivity;
  late FocusNode _priceFocusNode;
  late FocusNode _urlFocusNode;
  late bool _isLoading = false;
  late String? _nameInputAsync;

  @override
  void initState() {
    _newActivity =
        Activity(city: widget.cityName, name: '', image: '', price: 0);
    super.initState();
    _priceFocusNode = FocusNode();
    _urlFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  FormState get form {
    return _formKey.currentState!;
  }

  Future<void> submitForm() async {
    try {
      CityProvider cityProvider =
          Provider.of<CityProvider>(context, listen: false);
      _formKey.currentState!.save();
      setState(() => _isLoading = true);
      _nameInputAsync = await cityProvider.verifyIfActivityNameIsUnique(
        widget.cityName,
        _newActivity.name,
      );
      print(_nameInputAsync);
      if (form.validate()) {
        await cityProvider.addActivityToCity(_newActivity);
        setState(() => _isLoading = false);
        if (mounted) Navigator.pop(context);
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Remplissez le nom';
                } else if (_nameInputAsync != null) {
                  return _nameInputAsync;
                }
                return null;
              },
              onSaved: (value) => _newActivity.name = value!,
              decoration: const InputDecoration(
                labelText: 'Nom',
                hintText: 'Nom',
              ),
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_priceFocusNode),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              focusNode: _priceFocusNode,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Prix',
                hintText: 'Prix',
              ),
              onSaved: (value) => _newActivity.price = double.parse(value!),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Remplissez le prix';
                }
                return null;
              },
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_urlFocusNode),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              focusNode: _urlFocusNode,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                labelText: 'Url',
                hintText: 'Url',
              ),
              validator: (value) {
                if (value == '') {
                  return 'Remplissez l\'url';
                }
                return null;
              },
              onSaved: (value) => _newActivity.image = value!,
            ),
            const SizedBox(
              height: 10,
            ),
            const ActivityFormImagePicker(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Annuler'),
                ),
                ElevatedButton(
                  onPressed: _isLoading ? null : submitForm,
                  child: const Text('Sauvergarder'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
