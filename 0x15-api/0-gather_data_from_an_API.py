#!/usr/bin/python3
"""
Python script that, using this REST API, for a given employee ID,
returns information about his/her TODO list progress.
"""


import requests
from sys import argv


if __name__ == "__main__":
    emp_id = argv[1]

    user = requests.get('https://jsonplaceholder.typicode.com/users/{}'.
                        format(emp_id))
    searchname = user.json()

    for k, v in searchname.items():
        if k == "name":
            EMPLOYEE_NAME = v

    todo = requests.get(
        'https://jsonplaceholder.typicode.com/todos/?userId={}'.
        format(emp_id))
    todo_dict = todo.json()

    title = []
    t_completed = 0
    t_incompleted = 0
    for i in todo_dict:
        if i['completed'] is True:
            t_completed += 1
            title.append(i['title'])
        else:
            t_incompleted += 1

    NUMBER_OF_DONE_TASKS = t_completed
    TOTAL_NUMBER_OF_TASKS = t_completed + t_incompleted

    print("Employee {} is done with tasks({}/{}):".format(
        EMPLOYEE_NAME, NUMBER_OF_DONE_TASKS, TOTAL_NUMBER_OF_TASKS))
    for words in title:
        print("\t", words)
