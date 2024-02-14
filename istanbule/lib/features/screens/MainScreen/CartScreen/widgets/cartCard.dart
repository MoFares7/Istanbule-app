import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/widgets/mainButton.dart';

class CartCard extends StatefulWidget {
  CartCard({
    super.key,
    this.cartItem,
    this.onTap,
  });

  final CartItem? cartItem;
  final void Function()? onTap;
  // final Color? borderColor;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  final ValueNotifier<bool> _isEdit = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: MaterialButton(
        onLongPress: widget.onTap,
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.textColorWhiteBold,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ValueListenableBuilder(
            valueListenable: _isEdit,
            builder: (context, value, child) {
              return Column(
                children: [
                  Container(
                    height: 140,
                    // width: MediaQuery.of(context).size.width / 2 - 20,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/food2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.cartItem!.name,
                    style: getHeadFont(context),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price'.tr, style: getTitleFont(context)),
                        Text(widget.cartItem!.price,
                            style: getSupTitleFont(context)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Quantity'.tr, style: getTitleFont(context)),
                        Text(widget.cartItem!.quantity.toString(),
                            style: getSupTitleFont(context)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MainButton(
                        titleButton: 'Delete form cart',
                        color: AppColors.primary1,
                        titleButtonColor: AppColors.textColorWhiteBold,
                        onClickNext: () {},
                      ),
                      MainButton(
                        titleButton: 'Edit',
                        titleButtonColor: AppColors.textColorWhiteBold,
                        color: Color(0xFF212121),
                        onClickNext: () {
                          _isEdit.value = !_isEdit.value;
                        },
                      )
                    ],
                  ),
                  _isEdit.value
                      ? Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 10),
                          child: TextField(
                            cursorColor: AppColors.primary1,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: AppColors.primary1),
                            decoration: InputDecoration(
                                hintText: 'Edit on total'.tr,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.send,
                                    color: AppColors.primary1,
                                  ),
                                )),
                          ),
                        )
                      : const SizedBox()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ButtonTest extends StatelessWidget {
  const ButtonTest({super.key, this.onPressed, this.title, this.color});

  final void Function()? onPressed;
  final Color? color;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed!();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(title!, style: getButtonFont(context)),
      ),
    );
  }
}
