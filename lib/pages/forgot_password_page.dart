import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/auth_service.dart';
import '../graphql/auth_mutations.graphql.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetEmail() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _isLoading = true);
    
    try {
      final client = AuthService.instance.client;
      final result = await client.mutate$ForgotPassword(
        Options$Mutation$ForgotPassword(
          variables: Variables$Mutation$ForgotPassword(
            email: _emailController.text.trim(),
          ),
        ),
      );

      if (mounted) {
        setState(() => _isLoading = false);
        
        if (result.hasException) {
          _showErrorMessage('Failed to send reset email. Please try again.');
        } else if (result.parsedData?.forgotPassword?.success == true) {
          setState(() => _emailSent = true);
          _showSuccessMessage(result.parsedData!.forgotPassword!.message ?? 
              'Password reset instructions have been sent to your email.');
        } else {
          _showErrorMessage(result.parsedData?.forgotPassword?.message ?? 
              'Failed to send reset email. Please check your email address.');
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        _showErrorMessage('An error occurred. Please try again.');
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

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo/Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.lock_reset,
                  size: 32,
                  color: colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 24),
              
              // Headline
              Text(
                'Forgot Password?',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              
              Text(
                _emailSent 
                    ? 'We\'ve sent password reset instructions to your email. Please check your inbox and follow the instructions.'
                    : 'Don\'t worry! Enter your email address and we\'ll send you instructions to reset your password.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),
              
              if (!_emailSent) ...[
                // Reset Password Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Field
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(
                            Icons.email_outlined,
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
                            borderSide: BorderSide(color: colorScheme.primary, width: 2),
                          ),
                          fillColor: colorScheme.surface,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      
                      // Send Reset Email Button
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _sendResetEmail,
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
                                  'Send Reset Instructions',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onPrimary,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ] else ...[
                // Success State
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colorScheme.primary.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.mark_email_read_outlined,
                        size: 64,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Check Your Email',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'We\'ve sent password reset instructions to:',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _emailController.text.trim(),
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() => _emailSent = false);
                            _emailController.clear();
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: BorderSide(color: colorScheme.primary),
                          ),
                          child: Text(
                            'Try Another Email',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Didn\'t receive the email?',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  '• Check your spam or junk folder\n• Make sure you entered the correct email\n• Wait a few minutes and try again',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.6),
                    height: 1.5,
                  ),
                ),
              ],
              
              const SizedBox(height: 32),
              
              // Back to Sign In
              Center(
                child: TextButton(
                  onPressed: () => context.pop(),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Back to Sign In',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}