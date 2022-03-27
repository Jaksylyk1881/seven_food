import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:seven_food/data/cubit/profile_cubit/add_card_cubit.dart';
import 'package:seven_food/presentation/screens/main/main_list.dart';
import 'package:seven_food/presentation/widgets/blue_button.dart';
import 'package:seven_food/utils/utils.dart';

class CardAdd extends StatefulWidget {
  const CardAdd({
    Key? key,
  }) : super(key: key);

  @override
  _CardAddState createState() => _CardAddState();
}

class _CardAddState extends State<CardAdd> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Добавить карту"),
        ),
        body: BlocConsumer<AddCardCubit,AddCardState>(
          listener: (BuildContext context, Object? state) {
            if(state is AddCardStateLoading){
              setState(() {
                context.loaderOverlay.show();
              });
            }
            if(state is AddCardStateError){
              setState(() {
                context.loaderOverlay.hide();
                buildShowError(context, state.message);
              });
            }
            if(state is AddCardStateLoaded){
              setState(() {
                context.loaderOverlay.hide();
              });
              // BlocProvider.of<ProfileCubit>(context).getCards();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MainBottomList(pageId: 4,)));
            }
          },
          builder: (BuildContext context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    CreditCardForm(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      onCreditCardModelChange: onCreditCardModelChange,
                      themeColor: const Color(0xff1b447b),
                      formKey: formKey,
                      cardNumberDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder Name',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BlueButton(
                        callback: () {
                          BlocProvider.of<AddCardCubit>(context).addCard(cardNumber: cardNumber, cardDate: expiryDate, cardCVC: cvvCode, name: cardHolderName);
                        },
                        title: "Add card",
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
