import 'package:app/common/scaffold/app_scaffold.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:app/routes/app_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});
  @override
  State<UsersScreen> createState() => _UsersScreenState();
  
  class _UsersScreenState extends State<UsersScreen>{
    final List<UserData> _dummyDataList = List.generate(20, (i) {

    });
  }
  final _defaultInputBorder = const InputDecoration(
              filled: false,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE4E4E7),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )
              ),
              
            );

  void _onSearch(String value) {}

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appScreen: AppScreen.users,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //유저 목록 타이틀
          const Text(
            '유저 목록',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          15.heightBox,
          //검색바
          const TextField(
            decoration: 
            hintText: '유저 검색...',
          ),
          const Divider(),

          // NOTE : 유저 리스트뷰
          Expanded(child: ListView.separated(
            itemCount:_dummyDataList.length ,
            separatorBuilder: (context, index)=> const Divider(),
            itemBuilder: (context, Index){
              final dummy = _dummyDataList[index];
              return ListTile(leading: const CircleAvatar(
                backgroundColor: Color(0xFFEAEAEA),
                foregroundImage: NetworkImage(dummy.profileImageUrl,),
              ),
              title: Text(dummy.name,
              style: const TextStyle(fontWeight: ),
              ),
              subtitle: Text(dummy.studentNumber),
              );
            },
          
          ),)
        ],
      ),
    );
  }
}
