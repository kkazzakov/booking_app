import 'package:booking_app/theme/color.dart';
import 'package:flutter/material.dart';

class TouristInput extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  TouristInput({Key? key, required this.formKey}) : super(key: key);

  @override
  _TouristInputState createState() => _TouristInputState();
}

class _TouristInputState extends State<TouristInput> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController citizenshipController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController passportExpiryController = TextEditingController();

  bool _isExpanded = false;
  bool _isNameValid = true;
  bool _isSurnameValid = true;
  bool _isBirthdateValid = true;
  bool _isCitizenshipValid = true;
  bool _isPassportValid = true;
  bool _isPassportDateValid = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: EdgeInsets.all(0),
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  'Первый турист',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              );
            },
            body: Container(
              padding: EdgeInsets.all(16),
              child: Form(
                key: widget.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle( color: Colors.transparent, fontSize: 0, height: 0),
                        labelText: 'Имя',
                        filled: true,
                        fillColor: _isNameValid ? AppColor.background2 : Color(0x26EB5757),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _isNameValid = false;
                          });
                          return 'Пожалуйста, введите имя.';
                        } else {
                          setState(() {
                            _isNameValid = true;
                          });
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: surnameController,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle( color: Colors.transparent, fontSize: 0, height: 0),
                        labelText: 'Фамилия',
                        filled: true,
                        fillColor: _isSurnameValid ? AppColor.background2 : Color(0x26EB5757),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _isSurnameValid = false;
                          });
                          return 'Пожалуйста, введите фамилию.';
                        } else {
                          setState(() {
                            _isSurnameValid = true;
                          });
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: birthDateController,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle( color: Colors.transparent, fontSize: 0, height: 0),
                        labelText: 'Дата рождения',
                        filled: true,
                        fillColor: _isBirthdateValid ? AppColor.background2 : Color(0x26EB5757),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _isBirthdateValid = false;
                          });
                          return 'Пожалуйста, введите дату рождения.';
                        } else {
                          setState(() {
                            _isBirthdateValid = true;
                          });
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: citizenshipController,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle( color: Colors.transparent, fontSize: 0, height: 0),
                        labelText: 'Гражданство',
                        filled: true,
                        fillColor: _isCitizenshipValid ? AppColor.background2 : Color(0x26EB5757),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _isCitizenshipValid = false;
                          });
                          return 'Пожалуйста, укажите гражданство.';
                        } else {
                          setState(() {
                            _isCitizenshipValid = true;
                          });
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: passportNumberController,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle( color: Colors.transparent, fontSize: 0, height: 0),
                        labelText: 'Номер загранпаспорта',
                        filled: true,
                        fillColor: _isPassportValid ? AppColor.background2 : Color(0x26EB5757),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _isPassportValid = false;
                          });
                          return 'Пожалуйста, введите номер заграничного паспорта.';
                        } else {
                          setState(() {
                            _isPassportValid = true;
                          });
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: passportExpiryController,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle( color: Colors.transparent, fontSize: 0, height: 0),
                        labelText: 'Срок действия загранпаспорта',
                        filled: true,
                        fillColor: _isPassportDateValid ? AppColor.background2 : Color(0x26EB5757),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _isPassportDateValid = false;
                          });
                          return "d";
                        } else {
                          setState(() {
                            _isPassportDateValid = true;
                          });
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            isExpanded: _isExpanded,
          ),
        ],
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isExpanded = !isExpanded;
          });
        },
      ),
    );
  }
}
