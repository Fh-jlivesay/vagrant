Prototype Local Testing for Developers
======================================

Vagrant delivers a standardized testing environment
for use with this project.  This will include a simple
and automated method for building a local test server,
data seeding and application initialization.
 
Install VirtualBox and Vagrant
    https://www.virtualbox.org/  (You may use VMWare Workstation or Fusion as well, however mods to the config are required)
    https://www.vagrantup.com/   (VMWare requires the purchase of the Vagrant Plugin)

If you have not already, clone this repository into <Project>/vagrant

    cd <project>
    git clone git@git.joshualivesay.com:framework/vagrant.git

Vagrant is dependant on the prototype application being present in the <project> directory.  The structure must be exact.
Lets checkout the framework and yii2
    
    cd <project>
    git clone git@git.joshualivesay.com:framework/framework.git
    git clone git@git.joshualivesay.com:framework/yii2.git

Provision the development server.  (This takes a while)

    cd <project>/vagrant
    vagrant up

The server exists locally at 192.168.56.101.  Point your domains at it.
    # echo '192.168.56.101 fischer.dev www.fischer.dev' >> /etc/hosts

    $ vagrant halt (stops the machine)
    $ vagrant destroy (deletes the machine)
    $ vagrant up (brings it back online)
    $ vagrant provision (reprovisions)

To apply server config changes after a pull

    $ cd <project>/vagrant && vagrant provision --provision

ISSUES:
    Trouble running vagrant on VM with bridged connection.
    
TODO:
    Write a bash script to run database updates without provisioning
    Add ssh keys to .gitignore
    Workout Network vs Subnet issues.
    Keep this documentation up to date.
    


