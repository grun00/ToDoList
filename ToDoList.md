#This is a sample project for a simple To Do list with User registration and Log In credentials using Devise
#The ToDo list needs to be able to perfome the following:
1 - Create a Task
2 - Read a Task
3 - Update a Task
4 - Destroy a Task
#Tasks need to have a Date and Time(Of Creation and Of Action), Title, Description, Priorities(High, medium, low), and Status(Complete, Incomplete)
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
1 - A loged In User can view their own tasks in a Task Board <Check>
2 - A loged In User can view their own tasks individually <Check>
3 - A loged In user can filter for tasks by priority <Check>
4 - A loged In user can filter for tasks by update date <Check>
5 - A loged In user can filter for Complete tasks <Check>
6 - A loged In user can filter for Incomplete tasks <Check>
# Update a Task
1 - A loged in User can edit their task <Check>
2 - A loged in User can change the status from Complete to Incomplete <Check>
#Destroy a Task
1 - A loged in User can Delete an Individual Task from view page <Check>
2 - A loged in User can Delete any amount of Tasks from Task Board <???>
#Search
1 - A loged In User can search for tasks by title and find Exact Result
2 - A loged In User can search for tasks by title and find Partial Results
3 - A loged In User can search only for tasks that they own

##Comments Managment
#Create a Comment
1 - A User can Add a comment to an existing Task
2 - Validates Comment Body
#Read a Comment
1 - A User can view all coments in a Task
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

##Comments
#Body
