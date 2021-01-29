Shell project 0x01 list:
* 0-iam_betty: Create a script that changes your user ID to betty.
* 1-who_am_i: Script that prints the effective userid of the current user.
* 2-groups: script that prints all the groups the current user is part of.
* 3-new_owner: Script that changes the owner of the file hello to the user betty.
* 4-empty: Script that creates an empty file called hello.
* 5-execute: Script that adds execute permission to the owner of the file hello.
* 6-multiple_permissions: Script that adds execute permission to the owner and the group owner, and read permission to other users, to the file hello.
* 7-everybody: Script that adds execution permission to the owner, the group owner and the other users, to the file hello.
* 8-James_Bond: Script that sets the permission to the file hello as follows:
 * Owner: no permission at all.
 * Owner: no permission at all.
 * Other users: all the permissions.
* 9-John_Doe: Script that sets the mode of the file hello to this:
 * -rwxr-x-wx 1 julien julien 23 Sep 20 14:25 hello
* 10-mirror_permissions: Script that sets the mode of the file hello the same as ollehs mode.
* 11-directories_permissions: Script that adds execute permission to all subdirectories of the current directory for the owner, the group owner and all other users. Regular files should not be changed.
* 12-directory_permissions: Script that creates a directory called dir_holberton with permissions 751 in the working directory.
* 13-change_group: Script that changes the group owner to holberton for the file hello.
* 14-change_owner_and_group: Script that changes the owner to betty and the group owner to holberton for all the files and directories in the working directory.
* 15-symbolic_link_permissions: Script that changes the owner and the group owner of the file _hello to betty and holberton respectively.
 * The file _hello is a symbolic link.
* 16-if_only: Script that changes the owner of the file hello to betty only if it is owned by the user guillaume.