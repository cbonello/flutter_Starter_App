import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void fieldFocusChangeCallback(
  BuildContext context,
  FocusNode currentFocus,
  FocusNode nextFocus,
) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    Key key,
    String labelText,
    String helperText,
    String hintText,
    Color cursorColor = Colors.black,
    TextInputAction textInputAction,
    FocusNode focusNode,
    void Function(String) onFieldSubmitted,
    TextInputType keyboardType = TextInputType.text,
    TextCapitalization textCapitalization = TextCapitalization.none,
    bool readOnly = false,
    @required TextEditingController controller,
    String Function(String) validator,
  })  : _labelText = labelText,
        _helperText = helperText,
        _hintText = hintText,
        _cursorColor = cursorColor,
        _textInputAction = textInputAction,
        _focusNode = focusNode,
        _onFieldSubmitted = onFieldSubmitted,
        _keyboardType = keyboardType,
        _textCapitalization = textCapitalization,
        _readOnly = readOnly,
        _controller = controller,
        _validator = validator,
        super(key: key);

  final String _labelText, _helperText, _hintText;
  final TextInputAction _textInputAction;
  final Color _cursorColor;
  final FocusNode _focusNode;
  final void Function(String) _onFieldSubmitted;
  final TextInputType _keyboardType;
  final TextCapitalization _textCapitalization;
  final bool _readOnly;
  final TextEditingController _controller;
  final String Function(String) _validator;

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      decoration: InputDecoration(
        labelText: widget._labelText,
        helperText: widget._helperText,
        hintText: widget._hintText,
      ),
      textInputAction: widget._textInputAction,
      focusNode: widget._focusNode,
      onFieldSubmitted: widget._onFieldSubmitted,
      keyboardType: widget._keyboardType,
      textCapitalization: widget._textCapitalization,
      readOnly: widget._readOnly,
      autovalidate: true,
      autocorrect: false,
      validator: widget._validator,
      cursorColor: widget._cursorColor,
    );
  }
}

class AppPassworFormField extends StatefulWidget {
  const AppPassworFormField({
    Key key,
    String labelText = 'Password',
    String helperText,
    String hintText,
    Color cursorColor = Colors.black,
    TextInputAction textInputAction,
    FocusNode focusNode,
    void Function(String) onFieldSubmitted,
    bool readOnly = false,
    @required TextEditingController controller,
    String Function(String) validator,
  })  : _labelText = labelText,
        _helperText = helperText,
        _hintText = hintText,
        _cursorColor = cursorColor,
        _textInputAction = textInputAction,
        _focusNode = focusNode,
        _onFieldSubmitted = onFieldSubmitted,
        _readOnly = readOnly,
        _controller = controller,
        _validator = validator,
        super(key: key);

  final String _labelText, _helperText, _hintText;
  final bool _readOnly;
  final TextEditingController _controller;
  final Color _cursorColor;
  final TextInputAction _textInputAction;
  final FocusNode _focusNode;
  final void Function(String) _onFieldSubmitted;
  final String Function(String) _validator;

  @override
  _AppPassworFormFieldState createState() => _AppPassworFormFieldState();
}

class _AppPassworFormFieldState extends State<AppPassworFormField> {
  bool obscurePassword;

  @override
  void initState() {
    obscurePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      decoration: InputDecoration(
        labelText: widget._labelText,
        helperText: widget._helperText,
        hintText: widget._hintText,
        suffixIcon: PlatformIconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => setState(() => obscurePassword = !obscurePassword),
        ),
      ),
      textInputAction: widget._textInputAction,
      focusNode: widget._focusNode,
      onFieldSubmitted: widget._onFieldSubmitted,
      readOnly: widget._readOnly,
      obscureText: obscurePassword,
      autovalidate: true,
      autocorrect: false,
      validator: widget._validator,
      cursorColor: widget._cursorColor,
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    @required Widget child,
    @required Gradient gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  })  : assert(child != null),
        assert(gradient != null),
        _child = child,
        _gradient = gradient,
        super(key: key);

  final Widget _child;
  final Gradient _gradient;
  final double width;
  final double height;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(6.0);

    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        gradient: _gradient,
        borderRadius: borderRadius,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[500],
            offset: const Offset(1.0, 1.0),
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: _child,
            )),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    Key key,
    this.size = 30.0,
    this.icon = Icons.clear,
    this.onPressed,
  }) : super(key: key);

  final double size;
  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: const Alignment(0.0, 0.0),
          children: <Widget>[
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
            ),
            Icon(
              icon,
              size: size * 0.6,
            )
          ],
        ),
      ),
    );
  }
}
