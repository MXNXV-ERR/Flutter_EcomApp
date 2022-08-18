import 'package:flutter/material.dart';

class TxtFrmFld extends StatefulWidget {
  final String? Function(String?) validator;
  final String label;
  final Function onChanged;

  const TxtFrmFld({
    Key? key,
    required this.onChanged,
    required this.validator,
    required this.label,
  }) : super(key: key);

  @override
  State<TxtFrmFld> createState() => _TxtFrmFldState();
}

class _TxtFrmFldState extends State<TxtFrmFld> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 275,
      child: TextFormField(
        validator: widget.validator,
        decoration: InputDecoration(
          label: Text(widget.label),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PwdFrmFld extends StatefulWidget {
  bool obsecureTxt;
  final String? Function(String?) validator;
  final String label;
  final void Function() onTap;
  final Function onChanged;
  PwdFrmFld(
      {Key? key,
      required this.onChanged,
      required this.obsecureTxt,
      required this.validator,
      required this.label,
      required this.onTap})
      : super(key: key);

  @override
  State<PwdFrmFld> createState() => _PwdFrmFldState();
}

class _PwdFrmFldState extends State<PwdFrmFld> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 275,
      child: TextFormField(
        validator: widget.validator,
        obscureText: widget.obsecureTxt,
        decoration: InputDecoration(
          //contentPadding: const EdgeInsets.only(top: 20.0),
          label: const Text('Password'),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.obsecureTxt = !widget.obsecureTxt;
              });
            },
            child: Icon(
              widget.obsecureTxt == true
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
