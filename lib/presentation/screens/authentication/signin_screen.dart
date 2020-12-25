import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/authentication/authentication_bloc.dart';
import '../../utils/regex_validator.dart';
import '../../widgets/widgets.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _screenFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _nickNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _lastNameTextEditingController =
      TextEditingController();
  final TextEditingController _nickNameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  bool _hasBeenValidated = false;

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _nickNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _screenFocusNode.dispose();
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _nickNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passwordEditingController.dispose();
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
              children: [
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child:
                        BlocListener<AuthenticationBloc, AuthenticationState>(
                      listener: (context, state) {
                        if (state is AuthenticationSigninFailure) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black,
                              content: Text(state.message),
                              duration: Duration(milliseconds: 1000),
                            ),
                          );
                        } else if (state is AuthenticationSigninSuccess) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                title: Text('Registro Exitoso'),
                                titleTextStyle: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'ReemKufi',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 20.0,
                                ),
                                children: <Widget>[
                                  Text(
                                    state.message,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'ReemKufi',
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).then(
                            (value) => Navigator.pushReplacementNamed(
                              context,
                              '/login',
                            ),
                          );
                        }
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 250.0,
                                maxWidth: 350.0,
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Form(
                                  key: _formKey,
                                  onChanged: () {
                                    if (_hasBeenValidated)
                                      _formKey.currentState.validate();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Registro',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'ReemKufi',
                                          fontSize: 22,
                                        ),
                                      ),
                                      AppTextFormField(
                                        controller:
                                            _firstNameTextEditingController,
                                        focusNode: _firstNameFocusNode,
                                        labelText: 'Nombres',
                                        prefixIconData: Icons.person,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        validator: (firstName) {
                                          if (firstName.isEmpty) {
                                            return 'Por favor ingrese un nombre';
                                          }
                                          return null;
                                        },
                                        onEditingComplete: () =>
                                            _lastNameFocusNode.requestFocus(),
                                      ),
                                      AppTextFormField(
                                        controller:
                                            _lastNameTextEditingController,
                                        focusNode: _lastNameFocusNode,
                                        labelText: 'Apellidos',
                                        prefixIconData: Icons.text_fields,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        validator: (lastName) {
                                          if (lastName.isEmpty) {
                                            return 'Por favor ingrese un apellido';
                                          }
                                          return null;
                                        },
                                        onEditingComplete: () =>
                                            _nickNameFocusNode.requestFocus(),
                                      ),
                                      AppTextFormField(
                                        controller:
                                            _nickNameTextEditingController,
                                        focusNode: _nickNameFocusNode,
                                        labelText: 'Nickname',
                                        prefixIconData: Icons.person,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        validator: (nickName) {
                                          if (nickName.isEmpty) {
                                            return 'Por favor ingrese un nickName';
                                          }
                                          return null;
                                        },
                                        onEditingComplete: () =>
                                            _emailFocusNode.requestFocus(),
                                      ),
                                      AppTextFormField(
                                        controller: _emailTextEditingController,
                                        focusNode: _emailFocusNode,
                                        labelText: 'Correo Electrónico',
                                        prefixIconData: Icons.email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
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
                                            _passwordFocusNode.requestFocus(),
                                      ),
                                      AppTextFormField(
                                        controller: _passwordEditingController,
                                        focusNode: _passwordFocusNode,
                                        labelText: 'Contraseña',
                                        obscureText: true,
                                        prefixIconData: Icons.lock,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        textInputAction: TextInputAction.done,
                                        validator: (password) {
                                          if (password.isEmpty) {
                                            return 'Por favor ingrese una contraseña';
                                          }
                                          return null;
                                        },
                                        onEditingComplete: () =>
                                            FocusScope.of(context)
                                                .requestFocus(_screenFocusNode),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            BlocBuilder<AuthenticationBloc,
                                AuthenticationState>(builder: (context, state) {
                              if (state is AuthenticationSigninLoading) {
                                return CircularProgressIndicator();
                              }

                              return Hero(
                                tag: 'app-in-button-tag',
                                child: _buildSigninAction(context, state),
                              );
                            }),
                            AppAuthHyperlink(
                                padding: const EdgeInsets.only(top: 10.0),
                                questionText: '¿Ya posees una cuenta?',
                                hyperlinkText: 'Iniciar Sesión',
                                onTapHyperlink: () =>
                                    Navigator.pushReplacementNamed(
                                        context, '/login')
                                //Router.pushVoid(context, '/login'),
                                ),
                            AppCoFotter(
                              padding: const EdgeInsets.only(
                                bottom: 10.0,
                                top: 30.0,
                              ),
                            ),
                          ],
                        ),
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

  Widget _buildSigninAction(BuildContext context, AuthenticationState state) {
    return AppRaisedButton(
      text: 'Registrarse',
      onPressed: () {
        if (!_screenFocusNode.hasFocus) {
          FocusScope.of(context).requestFocus(_screenFocusNode);
        }
        if (!_hasBeenValidated) _hasBeenValidated = true;
        if (_formKey.currentState.validate()) {
          // TODO: Form Validated, call a signin service
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationSigninSubmitted(
            firstName: _firstNameTextEditingController.text,
            lastName: _lastNameTextEditingController.text,
            nickName: _nickNameTextEditingController.text,
            email: _emailTextEditingController.text,
            password: _passwordEditingController.text,
          ));
        }
      },
    );
  }
}
