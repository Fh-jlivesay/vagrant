======================================
Prototype Local Testing for Developers
======================================
     I am providing a standardized testing environment
for use with this project.  This will include a simple
and automated method for building a local test server,
data seeding and application initialization.
                                Nov 13 - Joshua Livesay

Install VirtualBox and Vagrant
    https://www.virtualbox.org/  (You may use VMWare Workstation or Fusion as well, however mods to the config are required)
    https://www.vagrantup.com/   (VMWare requires the purchase of the Vagrant Plugin)

Assume proper clone of Yii and the Codebase.  You have <project>/yii2 and <project>/website

    $ cd <project>
    $ git clone git@github.com:Fh-jlivesay/number-five-is-alive.git vagrant

The initial provisioning of the machine takes a while.

    $ cd <project>/vagrant && vagrant up

The server exists locally at 192.168.56.101.  Point your domains at it.
    # echo '192.168.56.101 fischer.dev www.fischer.dev' >> /etc/hosts

    $ vagrant halt (stops the machine)
    $ vagrant destroy (deletes the machine)

To apply server config changes after a pull
    $ cd <project>/vagrant && vagrant provision --provision

ISSUES:

    


TODO
    Write a bash script to run database updates without provisioning
    Add ssh keys to .gitignore
    Workout Network vs Subnet issues.
    


