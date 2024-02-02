import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:company_profile/home/data/manager/cubit.dart';
import 'package:company_profile/home/data/manager/states.dart';

class SocialContacts extends StatelessWidget {
  const SocialContacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokerCubit, BrokerStates>(
      builder: (context, state) {
        var cubit = BrokerCubit.get(context);
        return InkWell(
      onTap: () {
        cubit.selectAppBar(5,0);
      },
      child: HoverWidget(
        onHover: (event) {},
        hoverChild: const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Material(
                shape: CircleBorder(),
                elevation: 8.0,
                child: SizedBox(
                  width: 38,
                  height: 38,
                  child: CircleAvatar(
                    backgroundColor:  Colors.white,
                    child: Center(
                      child: Icon(
                      Icons.phone,
                      color: Color(0xffD19026),
                                    ),
                    ),
                  ),
                ),
              ),
            ),
        child: const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Material(
                shape: CircleBorder(),
                elevation: 8.0,
                child: SizedBox(
                  width: 38,
                  height: 38,
                  child: CircleAvatar(
                    backgroundColor:  Colors.white,
                    child: Center(
                      child: Icon(
                      Icons.phone,
                      color:  Color.fromARGB(255, 39, 35, 51),
                                    ),
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
      },
    );
  }
}
