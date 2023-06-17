# Commands & Tips
- ERROR: Error fetching remote repo 'origin' 
- Open a terminal or command prompt on your machine. Navigate to the directory of your local repository. In your case, it seems to be /home/vagrant/.jenkins/workspace/free-style.
- git fetch --prune 
- or
- 'git remote prune https://github.com/spring-petclinic/spring-framework-petclinic.git' to remove any old, conflicting branches