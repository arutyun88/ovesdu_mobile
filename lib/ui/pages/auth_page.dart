import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/config/app_colors.dart';
import 'package:ovesdu_mobile/ui/widgets/logo_sliver_delegate.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // bottom: false,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              // pinned: true,
              delegate: LogoDelegate(MediaQuery.of(context).size.height / 3),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'enter your username',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: .5,
                            color: AppColors.orange,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 1.0,
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        constraints: const BoxConstraints(minHeight: 40.0),
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.orange,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 10.0,
                            ),
                            child: const Text(
                              'next',
                              style: TextStyle(
                                color: AppColors.buttonTextColor,
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        constraints: const BoxConstraints(minHeight: 60.0),
                      ),
                    ),
                    Row(
                      children: const [
                        Spacer(),
                        Text(
                          'If you already have an account, please',
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          child: const Text(
                            'login',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.orange,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        constraints: const BoxConstraints(minHeight: 60.0),
                      ),
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) =>
                          AppColors.gradientFlagHorizontal.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: const Text(
                        '© Created by Arutyun Gevorkyan',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
