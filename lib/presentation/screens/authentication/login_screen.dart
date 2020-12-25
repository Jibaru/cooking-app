import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/authentication/authentication_bloc.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../utils/custom_colors.dart';
import '../../utils/regex_validator.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _screenFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  bool _hasBeenValidated = false;
  bool _keepLoggedIn = false;

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _screenFocusNode.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_screenFocusNode),
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          color: Colors.white,
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: BlocListener<AuthenticationBloc, AuthenticationState>(
                      listener: (context, state) {
                        if (state is AuthenticationLoginFailure) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black,
                              content: Text(state.message),
                              duration: Duration(milliseconds: 1000),
                            ),
                          );
                        } else if (state is AuthenticationLoginSuccess) {
                          BlocProvider.of<UserBloc>(context).add(UserLogIn());
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  width: 180,
                                  height: 180,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        // TODO: Change to app Logo
                                        image: NetworkImage(
                                            'https://dummyimage.com/250/b5b5b5/fff'),
                                      ),
                                    ),
                                  ),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: 250.0,
                                    maxWidth: 350.0,
                                  ),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Form(
                                      key: _formKey,
                                      onChanged: () {
                                        if (_hasBeenValidated)
                                          _formKey.currentState.validate();
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          AppTextFormField(
                                            controller:
                                                _emailTextEditingController,
                                            focusNode: _emailFocusNode,
                                            labelText: 'Correo Electrónico',
                                            prefixIconData: Icons.email,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (email) {
                                              if (email.isEmpty) {
                                                return 'Por favor ingrese un email';
                                              } else if (RegexValidation
                                                  .isInvalidEmail(email)) {
                                                return 'Correo electrónico inválido';
                                              }
                                              return null;
                                            },
                                            onEditingComplete: () =>
                                                _passwordFocusNode
                                                    .requestFocus(),
                                          ),
                                          AppTextFormField(
                                            controller:
                                                _passwordTextEditingController,
                                            focusNode: _passwordFocusNode,
                                            labelText: 'Contraseña',
                                            obscureText: true,
                                            prefixIconData: Icons.lock,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            textInputAction:
                                                TextInputAction.done,
                                            validator: (password) {
                                              if (password.isEmpty) {
                                                return 'Por favor ingrese una contraseña';
                                              }
                                              return null;
                                            },
                                            onEditingComplete: () =>
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                        _screenFocusNode),
                                          ),
                                          Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            alignment: WrapAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'Mantener sesión guardada',
                                                overflow: TextOverflow.visible,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black26,
                                                  fontFamily: 'ReemKufi',
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Switch.adaptive(
                                                value: _keepLoggedIn,
                                                activeColor: CustomColors.blue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _keepLoggedIn = value;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Hero(
                                  tag: 'app-in-button-tag',
                                  child: _buildLoginAction(context, state),
                                ),
                                AppAuthHyperlink(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    questionText: '¿No tienes una cuenta?',
                                    hyperlinkText: 'Regístrate',
                                    onTapHyperlink: () =>
                                        Navigator.pushReplacementNamed(
                                            context, '/signin')
                                    ),
                                AppCoFotter(
                                  padding: const EdgeInsets.only(
                                    bottom: 10.0,
                                    top: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10.0,
                  left: 10.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black38,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginAction(BuildContext context, AuthenticationState state) {
    if (state is AuthenticationLoginLoading) {
      return CircularProgressIndicator();
    }
    return AppRaisedButton(
      text: 'Iniciar Sesión',
      onPressed: () {
        if (!_screenFocusNode.hasFocus)
          FocusScope.of(context).requestFocus(_screenFocusNode);
        if (!_hasBeenValidated) _hasBeenValidated = true;
        if (_formKey.currentState.validate()) {
          BlocProvider.of<AuthenticationBloc>(context).add(
            AuthenticationLoginSubmitted(
              email: _emailTextEditingController.text,
              password: _passwordTextEditingController.text,
              keepLogged: _keepLoggedIn,
            ),
          );
        }
      },
    );
  }
}
