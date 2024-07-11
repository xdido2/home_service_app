import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:home_service_app/domain/provider/bookings_provider.dart';
import 'package:home_service_app/ui/data/get_categories.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';
import 'package:home_service_app/ui/widget/product_detail/button.dart';
import 'package:home_service_app/ui/widget/product_detail/pop_up_modal.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ServiceDetailPage extends StatelessWidget {
  final int categoryId;
  final int index;

  const ServiceDetailPage(
      {super.key, this.categoryId = 0, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.fourthColor,
        child: ServiceDetailPageBody(
          categoryId: categoryId,
          index: index,
        ),
      ),
      bottomNavigationBar: ProductDetailPageBottomNavBar(
        categoryId: categoryId,
        index: index,
      ),
    );
  }
}

class ServiceDetailPageBody extends StatelessWidget {
  final int categoryId;
  final int index;

  const ServiceDetailPageBody(
      {super.key, required this.categoryId, required this.index});

  @override
  Widget build(BuildContext context) {
    final List category = AppCategories.data.values.toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              const Image(
                image: AssetImage(
                    'assets/images/service/acServiceBackgroundImage.png'),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: Container(
                    color: AppColors.fourthBlurColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 21,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(112),
                          color: AppColors.ratingColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ImageIcon(
                              AssetImage(
                                  'assets/images/icons/app_icons/star.png'),
                              size: 10,
                              color: AppColors.activeIconColor,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              '4.5',
                              style: AppTextStyle.productDetailTextStyle,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${category[categoryId]['title']} $index',
                        style: AppTextStyle.productDetailTextStyle.copyWith(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 58,
                      ),
                      const TypeofProperty(),
                      const SizedBox(
                        height: 8,
                      ),
                      const QuantityColumn(),
                      const SizedBox(
                        height: 8,
                      ),
                      const DescriptionColumn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TypeofProperty extends StatefulWidget {
  const TypeofProperty({super.key});

  @override
  State<TypeofProperty> createState() => _TypeofPropertyState();
}

class _TypeofPropertyState extends State<TypeofProperty> {
  int selectedIndex = -1;

  void _handleButtonPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                color: AppColors.thirdColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Type of Property',
                style: AppTextStyle.serviceRowTitleTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => _handleButtonPress(0),
                child: Column(
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? AppColors.thirdColor
                            : AppColors.productDetailBtnColor,
                        borderRadius: BorderRadius.circular(18),
                        border: selectedIndex == 0
                            ? null
                            : Border.all(
                                width: 2,
                                color: AppColors.productDetailBtnBorderColor,
                              ),
                      ),
                      child: const ImageIcon(
                        AssetImage(
                            'assets/images/icons/app_icons/home_page_icon.png'),
                        color: AppColors.productDetailBtnIconColor,
                        size: 26,
                      ),
                    ),
                    Text('Home', style: AppTextStyle.categoryItemTextStyle)
                  ],
                ),
              ),
              InkWell(
                onTap: () => _handleButtonPress(1),
                child: Column(
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: selectedIndex == 1
                            ? AppColors.thirdColor
                            : AppColors.productDetailBtnColor,
                        borderRadius: BorderRadius.circular(18),
                        border: selectedIndex == 1
                            ? null
                            : Border.all(
                                width: 2,
                                color: AppColors.productDetailBtnBorderColor,
                              ),
                      ),
                      child: const ImageIcon(
                        AssetImage(
                            'assets/images/icons/app_icons/office_property_icon.png'),
                        color: AppColors.productDetailBtnIconColor,
                        size: 26,
                      ),
                    ),
                    Text('Office', style: AppTextStyle.categoryItemTextStyle)
                  ],
                ),
              ),
              InkWell(
                onTap: () => _handleButtonPress(2),
                child: Column(
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: selectedIndex == 2
                            ? AppColors.thirdColor
                            : AppColors.productDetailBtnColor,
                        borderRadius: BorderRadius.circular(18),
                        border: selectedIndex == 2
                            ? null
                            : Border.all(
                                width: 2,
                                color: AppColors.productDetailBtnBorderColor,
                              ),
                      ),
                      child: const ImageIcon(
                        AssetImage(
                            'assets/images/icons/app_icons/office_property_icon.png'),
                        color: AppColors.productDetailBtnIconColor,
                        size: 26,
                      ),
                    ),
                    Text('Vila', style: AppTextStyle.categoryItemTextStyle)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuantityColumn extends StatefulWidget {
  const QuantityColumn({super.key});

  @override
  State<QuantityColumn> createState() => _QuantityColumnState();
}

class _QuantityColumnState extends State<QuantityColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          InputQuantity(
            title: 'Number of Units',
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: AppColors.productDetailBtnBorderColor,
          ),
          SizedBox(
            height: 8,
          ),
          InputQuantity(
            title: 'Number of Bedrooms',
          ),
        ],
      ),
    );
  }
}

class InputQuantity extends StatefulWidget {
  final String title;

  const InputQuantity({super.key, required this.title});

  @override
  State<InputQuantity> createState() => _InputQuantityState();
}

class _InputQuantityState extends State<InputQuantity> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: AppTextStyle.productDetailQuantityTitleTextStyle,
        ),
        Container(
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    if (quantity > 0) {
                      quantity--;
                    }
                  });
                },
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: quantity == 0
                        ? Colors.transparent
                        : AppColors.thirdColor,
                    border: quantity == 0
                        ? Border.all(
                            width: 2,
                            color: AppColors.productDetailBtnBorderColor)
                        : null,
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                child: TextField(
                  textAlign: TextAlign.center,
                  readOnly: true,
                  style: const TextStyle(
                      color: AppColors.primaryTextColor,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  controller: TextEditingController(text: quantity.toString()),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (quantity < 100) {
                      quantity++;
                    }
                  });
                },
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: quantity == 100
                        ? Colors.transparent
                        : AppColors.thirdColor,
                    border: quantity == 100
                        ? Border.all(
                            width: 2,
                            color: AppColors.productDetailBtnBorderColor)
                        : null,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DescriptionColumn extends StatelessWidget {
  const DescriptionColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final QuillController controller = QuillController.basic();
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 244),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 20,
                  color: AppColors.thirdColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Description',
                  style: AppTextStyle.serviceRowTitleTextStyle,
                ),
              ],
            ),
            QuillToolbar.simple(
              configurations: QuillSimpleToolbarConfigurations(
                controller: controller,
                showDividers: false,
                showFontFamily: false,
                showFontSize: false,
                showBoldButton: true,
                showItalicButton: true,
                showSmallButton: false,
                showUnderLineButton: true,
                showStrikeThrough: false,
                showInlineCode: false,
                showColorButton: true,
                showBackgroundColorButton: false,
                showClearFormat: false,
                showAlignmentButtons: false,
                showLeftAlignment: false,
                showCenterAlignment: false,
                showRightAlignment: false,
                showJustifyAlignment: false,
                showHeaderStyle: false,
                showListNumbers: false,
                showListBullets: false,
                showListCheck: false,
                showCodeBlock: false,
                showQuote: false,
                showIndent: false,
                showLink: true,
                showUndo: false,
                showRedo: false,
                showDirection: false,
                showSearchButton: false,
                showSubscript: false,
                showSuperscript: false,
                showClipboardCut: false,
                showClipboardCopy: false,
                showClipboardPaste: false,
              ),
            ),
            QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailPageBottomNavBar extends StatelessWidget {
  final int categoryId;
  final int index;

  const ProductDetailPageBottomNavBar(
      {super.key, required this.categoryId, required this.index});

  @override
  Widget build(BuildContext context) {
    void openPopUp() {
      showModalBottomSheet(
          context: context,
          builder: (context) => PopUpModal(
                categoryId: categoryId,
                index: index,
              ),
          backgroundColor: AppColors.primaryColor);
    }

    return Container(
      padding: const EdgeInsets.all(16),
      height: 124,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Total: ',
                    style: AppTextStyle.productDetailPriceTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.thirdTextColor),
                  ),
                  Text(
                    'USD 128',
                    style: AppTextStyle.productDetailPriceTextStyle,
                  ),
                ],
              ),
              InkWell(
                child: Text(
                  'Bill Details',
                  style: AppTextStyle.productDetailPriceTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.productDetailBillDetailsTextColor,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pageDetailBtn(context, 'Save Draft', openPopUp),
              pageDetailBtn(context, 'Book Now', openPopUp),
            ],
          )
        ],
      ),
    );
  }
}

class PopUpModal extends StatefulWidget {
  final int categoryId;
  final int index;

  const PopUpModal({super.key, required this.categoryId, required this.index});

  @override
  State<PopUpModal> createState() => _PopUpModalState();
}

class _PopUpModalState extends State<PopUpModal> {
  DateTime? chooseDate;
  TimeOfDay? chooseTime;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BookingsProvider>(context);
    List category = AppCategories.data.values.toList();

    Future<void> selectDate() async {
      DateTime? date = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (date != null) {
        setState(() {
          chooseDate = date;
        });
      }
    }

    Future<void> selectTime() async {
      TimeOfDay? time =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (time != null) {
        setState(() {
          chooseTime = time;
        });
      }
    }

    void confirm() {
      if (chooseDate == null || chooseTime == null) {
        return;
      }

      model.addBooking(
        context,
        DateFormat('dd MMM').format(chooseDate!),
        '${category[widget.categoryId]['title']} ${widget.index}',
        widget.categoryId,
        chooseTime!.format(context),
      );

      Navigator.pop(context);

      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          backgroundColor: Colors.green,
          title: Text(
            'Success!',
            style: TextStyle(color: AppColors.primaryTextColor, fontSize: 18),
          ),
        ),
      );
    }

    return Container(
      height: 356,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 20,
                    color: AppColors.thirdColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Select your Date & Time?',
                    style: AppTextStyle.serviceRowTitleTextStyle,
                  ),
                ],
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.iconBtnColor)),
                icon: const Icon(
                  Icons.close,
                  size: 20,
                ),
                color: AppColors.primaryTextColor,
              )
            ],
          ),
          popUpModalBtn(
            context,
            'Date'.toUpperCase(),
            AppColors.productDetailPopUpModalChooseBtn1Color,
            'assets/images/icons/app_icons/calendar_icon2.png',
            selectDate,
            chooseDate != null
                ? DateFormat('dd MMM').format(chooseDate!)
                : 'Select your Date',
          ),
          popUpModalBtn(
            context,
            'Time'.toUpperCase(),
            AppColors.productDetailPopUpModalChooseBtn2Color,
            'assets/images/icons/app_icons/clock_icon.png',
            selectTime,
            chooseTime != null
                ? chooseTime!.format(context)
                : 'Select your Time',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Total: ',
                    style: AppTextStyle.productDetailPriceTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.thirdTextColor),
                  ),
                  Text(
                    'USD 128',
                    style: AppTextStyle.productDetailPriceTextStyle,
                  ),
                ],
              ),
              InkWell(
                child: Text(
                  'Bill Details',
                  style: AppTextStyle.productDetailPriceTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.productDetailBillDetailsTextColor,
                  ),
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () => confirm(),
            style: ButtonStyle(
              minimumSize: const WidgetStatePropertyAll(
                Size(double.infinity, 48),
              ),
              backgroundColor: const WidgetStatePropertyAll(
                  AppColors.productDetailPopUpModalChooseBtn3Color),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: Text(
              'Confirm',
              style: AppTextStyle.productDetailBtnTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
