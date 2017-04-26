# task-graph
Ruby task list as a directed graph of dependencies


# DB schema
```
Users: id | name
Task: id | name | completed | description | priority
Edges: id | user_id | from_task_id | to_task_id
```