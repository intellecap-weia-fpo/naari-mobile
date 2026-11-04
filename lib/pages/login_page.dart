import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../config.dart';
import '../services/auth_service.dart';
import '../widgets/app_version_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final rememberMe = await AuthService.instance.getRememberMePreference();
    if (rememberMe) {
      final username = await AuthService.instance.getSavedUsername();
      if (username != null) {
        setState(() {
          _emailController.text = username;
          _rememberMe = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final success = await AuthService.instance.signIn(
        _emailController.text.trim(),
        _passwordController.text,
        rememberMe: _rememberMe,
      );

      if (mounted) {
        setState(() => _isLoading = false);

        if (success) {
          // Navigation will be handled by GoRouter's redirect logic
          context.go('/home/dashboard');
        } else {
          _showErrorMessage('Invalid username or password');
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        _showErrorMessage('Login failed. Please try again.');
      }
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Logo/Icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/icon-512.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'NAARI Survey',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              InkWell(
                onTap: () => context.go('/'),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.business, size: 16, color: colorScheme.primary),
                      const SizedBox(width: 6),
                      Text(
                        'Workspace: ${Config.workspaceName}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.edit, size: 14, color: colorScheme.primary),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              AppVersionText(
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 16),

              // Headline
              Text(
                'Your Voice, Our\nNation\'s Progress',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),

              Text(
                'Join us to make your voice count and contribute to an empowered nation.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),

              // Login Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Email/Username Field
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email or Username',
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: colorScheme.outline),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: colorScheme.outline),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        fillColor: colorScheme.surface,
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email or username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: colorScheme.outline),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: colorScheme.outline),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        fillColor: colorScheme.surface,
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),

                    // Remember Me and Forgot Password Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                              activeColor: colorScheme.primary,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            Text(
                              'Remember Me',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            context.push('/forgot-password');
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Forgot Password?',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: colorScheme.onPrimary,
                                ),
                              )
                            : Text(
                                'Continue',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Sign Up Link
                    TextButton(
                      onPressed: () => context.push('/privacy-policy'),
                      child: const Text('Privacy Policy'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.push('/register');
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Sign Up',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
