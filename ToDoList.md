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
1 - Loged In User can Create one Task
2 - Validades name(Uniqueness)
3 - Validades Future Date(Must be in future)
4 - Is created with default value of Incomplete
#Read a Task
1 - A loged In User can view their own tasks in a Task Board
2 - A loged In User can view their own tasks individually
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

