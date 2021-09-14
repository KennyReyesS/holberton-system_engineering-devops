#!/usr/bin/python3
"""
Using what you did in the task #0, extend your Python script
to export data in the JSON format.
"""

import json
import requests


if __name__ == "__main__":

    user = requests.get('https://jsonplaceholder.typicode.com/users')
    searchid = user.json()
    """for k, v in searchname.items():
        if k == "username":
            USERNAME = v"""

    all_dict = {}
    for key in searchid:
        USERNAME = key.get('username')
        USER_ID = key.get('id')

        todo = requests.get(
            'https://jsonplaceholder.typicode.com/todos/?userId={}'.
            format(USER_ID))
        todo_dict = todo.json()

        new_list = []
        for k in todo_dict:
            new_list.append({"username": USERNAME,
                             "task": k.get("title"),
                             "completed": k.get("completed")})

            all_dict[USER_ID] = new_list

    with open("todo_all_employees.json", 'w') as employee_json:
        json.dump(all_dict, employee_json)
