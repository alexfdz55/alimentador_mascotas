// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class TextFieldCustom extends StatefulWidget {
//   final TextEditingController controller;
//   // final String hintText;
//   final String textValidation;
//   final TextInputType textInputType;
//   final bool password;
//   final IconData icon;
//   final bool capitalization;
//   final Function onChanged;
//   final bool colorNormal;

//   TextFieldCustom(
//       {required this.controller,
//       // required this.hintText,
//       required this.textValidation,
//       required this.textInputType,
//       this.password = false,
//       required this.icon,
//       this.capitalization = false,
//       required this.onChanged,
//       this.colorNormal = false});

//   @override
//   _TextFieldCustomState createState() => _TextFieldCustomState();
// }

// class _TextFieldCustomState extends State<TextFieldCustom> {
//   bool hintPassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.0),
//           //color: Colors.white.withAlpha(180),
//           color: Colors.grey.withOpacity(0.6)

//           // color: widget.colorNormal
//           //     ? Colors.grey.withOpacity(0.3)
//           //     : Theme.of(context).backgroundColor.withAlpha(180),
//           // boxShadow: <BoxShadow>[
//           //   BoxShadow(
//           //       color: Colors.black26,
//           //       blurRadius: 4.0,
//           //       spreadRadius: 1.0,
//           //       offset: Offset(1.0, 4.0))
//           // ],
//           ),
//       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
//       child: TextFormField(
//           controller: widget.controller,
//           style: TextStyle(
//             fontSize: 20,
//             color: Theme.of(context).hintColor,
//           ),
//           textCapitalization: (widget.capitalization)
//               ? TextCapitalization.sentences
//               : TextCapitalization.none,
//           keyboardType: widget.textInputType,
//           obscureText: widget.password ? hintPassword : false,
//           decoration: InputDecoration(
//               prefixIcon: Icon(
//                 widget.icon,
//                 size: 20,
//                 color: Colors.white,
//               ),
//               // hintText: widget.hintText,
//               hintStyle:
//                   TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
//               suffixIcon: widget.password ? buttonShowPassword() : null,

//               //contentPadding: EdgeInsets.symmetric(horizontal: 20),
//               border: InputBorder.none),
//           onChanged: (value) {
//             widget.onChanged();
//           }

//           //validator: (value) => value!.trim().isEmpty ? 'Email required' : null,
//           ),
//     );
//   }

//   buttonShowPassword() {
//     return InkWell(
//       borderRadius: BorderRadius.circular(30),
//       child: Container(
//         padding: EdgeInsets.all(4),
//         child: Icon(
//           hintPassword
//               ? FontAwesomeIcons.solidEye
//               : FontAwesomeIcons.solidEyeSlash,
//           size: 20,
//           color: Colors.white,
//         ),
//       ),
//       onTap: () {
//         hintPassword = !hintPassword;
//         setState(() {});
//       },
//     );
//   }
// }
