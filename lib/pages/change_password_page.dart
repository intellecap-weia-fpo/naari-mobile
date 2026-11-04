import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/auth_service.dart';
import '../graphql/auth_mutations.graphql.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _obscureOldPassword = true;
  bool _obscureNewPassword = true;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _isLoading = true);
    
    try {
      final client = AuthService.instance.client;
      final result = await client.mutate$ChangePassword(
        Options$Mutation$ChangePassword(
          variables: Variables$Mutation$ChangePassword(
            oldPassword: _oldPasswordController.text,
            newPassword: _newPasswordController.text,
          ),
        ),
      );

      if (mounted) {
        setState(() => _isLoading = false);
        
        if (result.hasException) {
          _showErrorMessage('Failed to change password. Please try again.');
        } else if (result.parsedData?.changePassword?.success == true) {
          _showSuccessMessage(result.parsedData!.changePassword!.message ?? 
              'Password changed successfully.');
          context.pop();
        } else {
          _showErrorMessage(result.parsedData?.changePassword?.message ?? 
              'Failed to change password. Please check your current password.');
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
        duration: const Duration(seconds: 3),
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
        title: const Text('Change Password'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update Your Password',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              
              Text(
                'Please enter your current password and choose a new one.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 32),
              
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _oldPasswordController,
                      obscureText: _obscureOldPassword,
                      decoration: InputDecoration(
                        labelText: 'Current Password',
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureOldPassword ? Icons.visibility_off : Icons.visibility,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureOldPassword = !_obscureOldPassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your current password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    
                    TextFormField(
                      controller: _newPasswordController,
                      obscureText: _obscureNewPassword,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        prefixIcon: Icon(
                          Icons.lock_reset,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureNewPassword = !_obscureNewPassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a new password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        if (value == _oldPasswordController.text) {
                          return 'New password must be different from current password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _changePassword,
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
                                'Update Password',
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
            ],
          ),
        ),
      ),
    );
  }
}
