import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormCheckBox extends StatefulWidget {
  final String attribute;
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;

  FormCheckBox(
      {Key key,
      this.attribute,
      this.backgroundColor,
      this.icon,
      this.iconColor})
      : super(key: key);

  @override
  _FormCheckBoxState createState() => _FormCheckBoxState();
}

class _FormCheckBoxState extends State<FormCheckBox> {
  FormBuilderState _formState;
  final GlobalKey<FormFieldState> _checkBoxKey = GlobalKey<FormFieldState>();
  @override
  void initState() {
    _formState = FormBuilder.of(context);
    _formState?.registerFieldKey(widget.attribute, _checkBoxKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
        onSaved: (val) {
          _formState?.setAttributeValue(widget.attribute, val);
        },
        initialValue: false,
        builder: (FormFieldState<bool> field) {
          return Row(
            children: [
              CircleContainer(
                  icon: widget.icon,
                  backgroundColor:
                      field.value ? widget.backgroundColor : Colors.transparent,
                  iconColor:
                      field.value ? widget.iconColor : Colors.transparent,
                  onPressed: () {
                    field.didChange(!field.value);
                  }),
              SizedBox(
                width: 20.0,
              ),
              Text(widget.attribute)
            ],
          );
        });
  }
}

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    Key key,
    @required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.onPressed,
    this.radius,
  }) : super(key: key);
  final int radius;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            width: radius ?? 30,
            height: radius ?? 30,
            child: Icon(
              icon,
              color: this.iconColor ?? Colors.transparent,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: this.backgroundColor,
                border: Border.all(
                    color: this.backgroundColor.opacity == 0
                        ? Colors.black
                        : this.backgroundColor)),
          ),
        ),
      ),
    );
  }
}
