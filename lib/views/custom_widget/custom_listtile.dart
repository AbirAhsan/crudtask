import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? emailAddress;
  final void Function()? deleteButtonFunc;
  final void Function()? editButtonFunc;

  const CustomListTile(
      {Key? key,
      this.imageUrl,
      this.name,
      this.emailAddress,
      required this.deleteButtonFunc,
      required this.editButtonFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListTile(
            leading: CircleAvatar(
              foregroundImage: NetworkImage(imageUrl.toString()),
            ),
            title: Text("$name"),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$emailAddress"),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: editButtonFunc,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: deleteButtonFunc,
                    ),
                  ],
                ),
              ],
            ),
            // trailing: Row(
            //   children: const [Icon(Icons.delete), Icon(Icons.edit)],
          ),
        ),
      ),
    );
  }
}
