import 'package:farmicon/presentation/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Container1 extends StatelessWidget {
  const Container1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 14.h,
      decoration: BoxDecoration(
          color: const Color(0xFF403F3F),
          borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 20.w,
          child: Column(
            children: [
              Container(
                width: 5.h,
                height: 5.h,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/9c3d59714ee2079d2eb50e208085f0db.png",
                        ),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(100)),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 5.h,
                height: 5.h,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/280475cd7b271245d6fcd5df329cab5d.png",
                        ),
                        fit: BoxFit.fill),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: 50.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Radhey Shyam Maan",
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
              const Text(
                "Femto",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 15.sp,
                    color: Colors.white,
                  ),
                  Text(
                    "Startup Mahakhumbh, Delhi",
                    style: TextStyle(fontSize: 8.sp, color: Colors.white),
                  ),
                ],
              ),
              Text(
                "View details",
                style: TextStyle(
                    fontSize: 10.sp,
                    decoration: TextDecoration.underline,
                    color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.sp),
          width: 20.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.auto_fix_off_rounded,
                color: Colors.white,
              ),
              Container(
                width: 14.w,
                height: 3.5.h,
                decoration: BoxDecoration(
                    color: colors().secondary_color,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
