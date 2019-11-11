#This is a sample project for a simple To Do list with User registration and Log In credentials using Devise
#The ToDo list needs to be able to perfome the following:
1 - Create a Task
2 - Read a Task
3 - Update a Task
4 - Destroy a Task
#Tasks need to have a Date and Time(Of Creation and Of Action), Title, Description, Comments, and Status(Complete, Incomplete)
#Users need to be able to register, log in, log out, do basic operations on tasks, create a list of tasks.

#Tests
#Basic Utils
##Visitor Views Homepage
1 - Sucessfully
###User can Log in
1 - An existing account
2 - Create an Account
3 - Log out

#Tasks Managment
#Create a Task
1 - Loged In User can Create one Task <Check>
2 - Cannot create is not loged in  <Check>
3 - Validades name(length, blank)  <Check>
4 - Validates description for blank <Check>
5 - Only owner of task can see it <Check>
#Read a Task
1 - A loged In User can view their own tasks in a Task Board
2 - A loged In User can view their own tasks individually
3 - A loged In User can view their tasks ordered by priority in Homepage
4 - A loged In User can view their tasks ordered by date in Homepage
5 - A loged In User can view their tasks ordered by priority in Task Board
6 - A loged In User can view their tasks ordered by date in Task Board
7 - A loged In user can filter for tasks by priority
8 - A loged In User can search for tasks by title
9 - A loged In User can search for tasks by description
10 - A loged In User can search for tasks by priority
# Update a Task
1 - A loged in User can edit their own task's Description
2 - A loged in User can edit their own task's Name
3 - A loged in User can change the status of their task to Complete
4 - A loged in User can change the status of their task to Incomplete
#Destroy a Task
1 - A loged in User can Delete an Individual Task from view page
2 - A loged in User can Delete an Individual Task from Task Board
3 - A loged in User can Delete any amount of Tasks from Task Board

##Comments Managment
#Create a Comment
1 - A User can Add a comment to an existing Task
2 - Validates Comment Body
#Read a Comment
1 - A User can view all coments in a Task
#Update Comment
1 - A User can edit the content of a comment
#Destroy Comment
1 - A User can delete a comment 

#Models
##Tasks 
#Title
#Description
#Status(Default: Incomplete)
#Priority(High, medium low)
#A Task Belongs to a User
#A Task has Many Comments
