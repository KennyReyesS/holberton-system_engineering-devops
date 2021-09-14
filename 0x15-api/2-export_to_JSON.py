#!/usr/bin/python3
"""
Using what you did in the task #0, extend your Python script
to export data in the CSV format.
"""

import json
import requests
from sys import argv


if __name__ == "__main__":
    emp_id = argv[1]

    user = requests.get('https://jsonplaceholder.typicode.com/users/{}'.
                        format(emp_id))

    searchname = user.json()
    for k, v in searchname.items():
        if k == "username":
            USERNAME = v

    todo = requests.get(
        'https://jsonplaceholder.typicode.com/todos/?userId={}'.
        format(emp_id))
    todo_dict = todo.json()

    all_dict = {}
    new_list = []
    for k in todo_dict:
        new_list.append({"task": k.get("title"),
                         "completed": k.get("completed"),
                         "username": USERNAME})

    all_dict[emp_id] = new_list

    USER_ID = emp_id + ".json"
    with open(USER_ID, 'w') as employee_json:
        json.dump(all_dict, employee_json)
