import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmicon/data/firebase/get_data.dart';
import 'package:farmicon/presentation/constants/colors.dart';
import 'package:farmicon/presentation/widgets/container1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sizer/sizer.dart';

class Network extends StatefulWidget {
  const Network({super.key});

  @override
  State<Network> createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  TextEditingController search = TextEditingController();
  int page = 1;

  List<dynamic> filteredlist = [];

  Future<void> addtofilteredlist(String searchtext) async {
    List<dynamic> data = await Firebase().getdata();
    filteredlist = data
        .where((chars) =>
            chars['name'].toString().toLowerCase().startsWith(searchtext))
        .toList();
  }

  Future<List<dynamic>> getfiltereddata() async {
    if (filteredlist.isEmpty && search.text == "") {
      return await Firebase().getdata();
    } else {
      await addtofilteredlist(search.text);
      return filteredlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors().main_network_page_color,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.sp),
          width: 100.w,
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              Text(
                "Search for you companies here",
                style: TextStyle(color: colors().secondary_color),
              ),
              ////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 1.h,
              ),
              ////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              Row(
                children: [
                  SizedBox(
                    width: 73.w,
                    height: 6.h,
                    child: Form(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            addtofilteredlist(value);
                          });
                        },
                        style: const TextStyle(color: Colors.grey),
                        controller: search,
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    width: 14.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Icon(
                        Icons.filter_list,
                        size: 25.sp,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              ////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 2.h,
              ),
              ////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        page = 1;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      height: 4.5.h,
                      decoration: BoxDecoration(
                          color: page == 1
                              ? colors().secondary_color
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: page == 1 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        page = 2;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      height: 4.5.h,
                      decoration: BoxDecoration(
                          color: page == 2
                              ? colors().secondary_color
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Recently Visited",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: page == 2 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        page = 3;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      height: 4.5.h,
                      decoration: BoxDecoration(
                          color: page == 3
                              ? colors().secondary_color
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Saved",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: page == 3 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 2.h,
              ),
              ////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              const Container1(),
              ////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 4.h,
              ),
              ////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////////////

              SizedBox(
                width: 100.w,
                height: 44.h,
                child: FutureBuilder(
                  future: getfiltereddata(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Slidable(
                            endActionPane: ActionPane(
                              extentRatio: 0.2,
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                  icon: Icons.delete,
                                  onPressed: (context) {
                                    setState(() {
                                      FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(
                                              "${snapshot.data[index]['name']}")
                                          .delete()
                                          .then((value) {});
                                    });
                                  },
                                  backgroundColor: const Color(0xFF353C4A),
                                )
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 9,
                                    right: -1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF353C4A),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: 80.w,
                                      height: 14.h,
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 20, right: 8, left: 8),
                                  width: 95.w,
                                  height: 14.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: const AssetImage(
                                            "assets/images/d95e5ecb-5281-4b4a-94d2-4f7906e324ca.png"),
                                        fit: BoxFit.fill,
                                        colorFilter: ColorFilter.mode(
                                            Colors.white.withOpacity(0.4),
                                            BlendMode.dstATop),
                                      ),
                                      color: const Color(0xFF403F3F),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          width: 20.w,
                                          child: Container(
                                            width: 8.h,
                                            height: 8.h,
                                            decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                      "assets/images/600a7b417582c48bf127f48a5a76c9e2.png",
                                                    ),
                                                    fit: BoxFit.fill),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          width: 50.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${snapshot.data[index]['name']}",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.white),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 15.sp,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    "${snapshot.data[index]['address']}",
                                                    style: TextStyle(
                                                        fontSize: 8.sp,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Text(
                                                "View details",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10.sp,
                                                    decoration: TextDecoration
                                                        .underline),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.bottomRight,
                                            padding: EdgeInsets.all(10.sp),
                                            width: 18.w,
                                            child: Container(
                                              width: 14.w,
                                              height: 3.5.h,
                                              decoration: BoxDecoration(
                                                  color:
                                                      colors().secondary_color,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.download,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ))
                                      ]),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
