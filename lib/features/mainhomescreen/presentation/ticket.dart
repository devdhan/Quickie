import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickq/constants/colors.dart';
import 'package:quickq/commons/themes/text_theme.dart';
import 'package:quickq/constants/sizes.dart';
import 'ticket_detail.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> activeTickets = [
    {
      'cafeteria': 'Jubilee Cafeteria',
      'meal': 'Jollof Rice',
      'dateBought': '2024-06-10',
      'timeBought': '12:30 PM',
      'qr': true,
    },
  ];

  final List<Map<String, dynamic>> usedTickets = [
    {
      'cafeteria': 'Buwa Bukateria',
      'meal': 'Fried Rice',
      'dateBought': '2024-06-08',
      'timeBought': '1:00 PM',
      'dateUsed': '2024-06-08',
      'timeUsed': '1:30 PM',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _navigateToTicketDetail(
    BuildContext context,
    Map<String, dynamic> ticket,
    bool isActive,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => TicketDetailPage(ticket: ticket, isActive: isActive),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: appBarHeight,
        title: Text(
          'Tickets',
          style: AppTextTheme.secondaryText,
          textAlign: TextAlign.center,
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: buttonColor,
          labelColor: buttonColor,
          unselectedLabelColor: Colors.grey,
          labelStyle: AppTextTheme.boldText,
          unselectedLabelStyle: AppTextTheme.boldText,
          tabs: [Tab(text: 'Active'), Tab(text: 'Used')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Active Tickets
          Padding(
            padding: EdgeInsets.all(16.w),
            child:
                activeTickets.isEmpty
                    ? Center(child: Text('No active tickets'))
                    : ListView.separated(
                      itemCount: activeTickets.length,
                      separatorBuilder:
                          (context, index) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final ticket = activeTickets[index];
                        return ListTile(
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            side: BorderSide(color: cardborder, width: 1.w),
                          ),
                          title: Text(
                            ticket['cafeteria'],
                            style: AppTextTheme.boldText,
                          ),
                          subtitle: Text(
                            ticket['meal'],
                            style: AppTextTheme.tinyMeduim,
                          ),
                          trailing: Icon(Icons.qr_code, color: buttonColor),
                          onTap:
                              () => _navigateToTicketDetail(
                                context,
                                ticket,
                                true,
                              ),
                        );
                      },
                    ),
          ),
          // Used Tickets
          Padding(
            padding: EdgeInsets.all(16.w),
            child:
                usedTickets.isEmpty
                    ? Center(child: Text('No used tickets'))
                    : ListView.separated(
                      itemCount: usedTickets.length,
                      separatorBuilder:
                          (context, index) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final ticket = usedTickets[index];
                        return ListTile(
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            side: BorderSide(color: cardborder, width: 1),
                          ),
                          title: Text(
                            ticket['cafeteria'],
                            style: AppTextTheme.boldText,
                          ),
                          subtitle: Text(
                            ticket['meal'],
                            style: AppTextTheme.tinyMeduim,
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.grey,
                          ),
                          onTap:
                              () => _navigateToTicketDetail(
                                context,
                                ticket,
                                false,
                              ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
