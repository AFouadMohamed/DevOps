                                                                                                <h1 style="text-align: center;">Project-1</h1>

  # VagrantProject
Vagrant Multi-VM Setup for Web Application This Vagrantfile sets up a multi-VM environment for a web application with different components such as a database server, Memcached server, RabbitMQ server, application server (Tomcat), and a web server (Nginx). Each VM is provisioned with the necessary software using shell scripts


![image](https://github.com/user-attachments/assets/a0122911-9939-4531-964a-defa2fc9f2c5)


# What tools will we use in the project?

# Prerequisite
1. Oracle VM Virtualbox
2. Vagrant                                                                                                
3. Vagrant plugins

# PROVISIONING
Services
1. Nginx => Web Service
2. Tomcat => Application Server                                                                            

3. RabbitMQ => Broker/Queuing Agent
4. Memcache => DB Caching
5. ElasticSearch => Indexing/Search service
6. MySQL => SQL Database 

![image](https://github.com/user-attachments/assets/a4031b02-40c4-4d91-9aad-7565d6d3ac7d)

# Project Steps

# 1:Create shell script (Backend VMs) 
 Create a ShellScript file for the Database we will call mariadb.sh  We will write the following in the file 

![image](https://github.com/user-attachments/assets/069d7a26-b769-438d-a0bb-0daa7c5f0aa0)

![image](https://github.com/user-attachments/assets/f13facf4-6784-459f-8f16-6250e91e57f4)

![image](https://github.com/user-attachments/assets/9106d02b-b5c5-46ac-a797-a3aabd6c6391)


#2 Create a ShellScript file for Memcached we will call Memcached.sh  We will write the following in the file 

  ![image](https://github.com/user-attachments/assets/3c3e5102-c23b-4334-b893-befa45773ace)


#3 Create a ShellScript file for RabbitMQ  that we will call RabbitMQ.sh  We will write the following in the file 

![image](https://github.com/user-attachments/assets/14c2deae-c910-453c-a3b2-a8fa088a9233)


#4 Create a ShellScript file for APP  include ( tomcat, nginx )

# 1: TOMCAT

![image](https://github.com/user-attachments/assets/79fab7ca-679c-42e2-973d-155aa85eb74c)


![image](https://github.com/user-attachments/assets/ec062160-3fc3-4818-a280-a3163d61a173)


![image](https://github.com/user-attachments/assets/ae812301-50e4-4518-b4e9-c0fd00b13d91)


![image](https://github.com/user-attachments/assets/3375b7f6-78c0-45dd-8cde-2424b0b2692c)

# 2: NGINX 
![image](https://github.com/user-attachments/assets/45b333b8-8934-44c8-907e-bdd324c177a4)

# After writing the scripts
 we will write a vagrantfile, which should be like this, and we will put in it all the VMs that we will create, we will also make a private network to connect the VMs and introduce them 

 ![image](https://github.com/user-attachments/assets/31f873bf-9913-43f4-b71d-a03b8ede2cb9)

 
 ![image](https://github.com/user-attachments/assets/8af07c38-6f23-4e41-99c1-793ecde28ff2)

 ![image](https://github.com/user-attachments/assets/c59ee219-e8b8-4573-a174-2bf8496ef1ca)

 # After all these steps, type inside the cmd in its own path 


 And in the end, this is the picture of the project 

![image](https://github.com/user-attachments/assets/d0e29e05-a444-4c23-9757-c3f63a38e0d8)


# The problems I faced and then solved them 

1: If you use Vagrant on VM, this problem will appear  
![image](https://github.com/user-attachments/assets/78fdbc3a-4785-41a3-8fa9-4ea4ab02f786)

# The solution is to use Vagrant on the physical machine and not the VM 
# What do we learn from vagrants?
1. Improve your technical skills:
Working with Vagrant will enhance your skills in managing virtual environments and automation. You will learn how to set up complex development environments, which can be invaluable in your field.
2. Save time and effort:
Instead of spending hours setting up new development environments or fixing issues caused by differences between environments, you can save time by using Vagrant to quickly and easily set up a ready-made, consistent environment.
3. Reduce errors:
Vagrant helps reduce errors caused by differences in environments, making you more efficient and reducing the number of problems you may encounter while developing or testing software.
4. Develop isolated environments for testing:
You can use Vagrant to create isolated environments for testing, allowing you to experiment with new settings or software without affecting your platform. This is useful if you want to try something new without compromising your current environment.
5. Ease of sharing the environment with others:
If you work in a team, you can share a Vagrantfile with your colleagues, making it easier for them to set up an identical development environment to avoid compatibility issues.
6. Increased Productivity:
With Vagrant, you can easily create complex environments with the click of a button, increasing your productivity and allowing you to focus on software development instead of spending time setting up the environment.
7. Explore New Technologies:
Vagrant can be your gateway to learning new technologies such as configuration management tools (Ansible, Chef, Puppet) or different operating systems. If you want to expand your knowledge and expertise, Vagrant can help you do that.
8. Improved Personal Development Experience:
Overall, Vagrant makes the development process smoother and more efficient. You’ll find yourself less distracted by environmental issues and more focused on solving actual software problems.
9. Easily Work Remotely:
If you work remotely or on multiple devices, you can easily move your environment between different devices using Vagrant, allowing you to continue working from anywhere without worrying about setting up the environment.
In short, using Vagrant can make your daily work more efficient, reduce errors, and increase your productivity. It also provides you with an opportunity to learn new technologies and improve your environment management skills.


                                                                                                               # 2: Project-2
                                                                                                              

# Folder Project in my repository  has another project created  in AWS by automation script 

# 1: VPC
![image](https://github.com/user-attachments/assets/a4e8fff2-68ba-441c-8554-ef98e3769d84)

# 2: Security Group 
![image](https://github.com/user-attachments/assets/f6029778-8059-4811-a9f0-ebf56a8374d4)



#  Need more  information about this project created by user date (Script) in AWS can review the link 

https://github.com/AFouadMohamed/DevOps/tree/main/project/project-2




![thx4w-8 (1)](https://github.com/user-attachments/assets/469311fb-d559-44c1-a2a3-3563a7f7dfca)


 


 







