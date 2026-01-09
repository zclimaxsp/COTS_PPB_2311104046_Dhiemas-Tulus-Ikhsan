import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text('Detail Resep', style: AppTextStyle.section),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.s12),

              // TITLE
              Text(
                'Pho Rebus',
                style: AppTextStyle.title,
              ),
              const SizedBox(height: 4),

              // CATEGORY
              Text(
                'Kategori: Sarapan',
                style: AppTextStyle.caption,
              ),

              const SizedBox(height: AppSpacing.s16),

              // BAHAN
              Text('Bahan-bahan', style: AppTextStyle.section),
              const SizedBox(height: AppSpacing.s8),
              Text(
                'Mie (2 piring)\n'
                'Telur (2 butir)\n'
                'Bawang Merah (3 siung)\n'
                'Kecap Manis (2 sdm)',
                style: AppTextStyle.body,
              ),

              const SizedBox(height: AppSpacing.s16),

              // LANGKAH
              Text('Langkah-langkah', style: AppTextStyle.section),
              const SizedBox(height: AppSpacing.s8),
              Text(
                'Panaskan minyak.\n'
                'Tumis bumbu halus.\n'
                'Masukkan nasi dan bahan lain.\n'
                'Masak hingga matang.',
                style: AppTextStyle.body,
              ),

              const SizedBox(height: AppSpacing.s16),

              // CATATAN
              Text('Catatan', style: AppTextStyle.section),
              const SizedBox(height: AppSpacing.s8),
              Text(
                'Tambahkan kerupuk untuk pelengkap.',
                style: AppTextStyle.body,
              ),

              const Spacer(),

              // BUTTON
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Simpan ke Favorit',
                    style: AppTextStyle.button,
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