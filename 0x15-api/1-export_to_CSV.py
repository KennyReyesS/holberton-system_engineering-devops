#!/usr/bin/python3
"""
Using what you did in the task #0, extend your Python script
to export data in the CSV format.
"""


import requests
from sys import argv
import csv


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

    USER_ID = emp_id + ".csv"
    with open(USER_ID, 'w') as employee_file:
        employee_writer = csv.writer(
            employee_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
        for k in todo_dict:
            employee_writer.writerow(
                [k['userId'], USERNAME, k['completed'], k['title']])
