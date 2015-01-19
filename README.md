Fischer Framework Local Testing for Developers
==============================================

About this Document
-------------------
This document covers minimum requirements for running a local
environment.  Once you are done here you should refer to the website/README.md
for more about team collaboration and upstream deployment.  Look for Team Collaboration section.

## If you have not already, fork CanDo-com/FischerPrototype.git into your own Github account.

Vagrant delivers a standardized testing environment
for use with this project.  This includes a simple
and automated method for building a local test server,
data seeding and application initialization.

Requirements
-------------
Install VirtualBox and Vagrant
* https://www.virtualbox.org/  (You may use VMWare Workstation or Fusion as well, however mods to the config are required)
* https://www.vagrantup.com/   (VMWare requires the purchase of the Vagrant Plugin)

Vagrant is dependant on the framework application being present in the <project> directory.  The structure must be exact.
Notice the framework and its modules are contained in "website".  This term ambiguious. We will change it later

Set-up
------
*Checkout the framework and yii2
 ,,,
    cd <project>
    git clone git@github.com:Fh-jlivesay/vagrant.git
    git clone git@github.com:{YOUR-USERNAME}/FischerPrototype.git website
        (We will set the upstream repository in a later step)
    git clone git@github.com:yiisoft/yii2.git
,,,

*Provision the development server.
,,,
    cd <project>/vagrant
    vagrant up
,,,
(Go get coffee)


The server exists locally at 192.168.56.101.  Point your domains at it.
    Linux/Mac Users:
    ,,,
    # echo '192.168.56.101 fischer.dev www.fischer.dev' >> /etc/hosts
    ,,,

    Windows users can run hosts.bat from this directory and it should
    add this line to the \Windows\system32\drivers\etc\hosts file
        192.168.56.101 fischer.dev www.fischer.dev
   ,,,
   notepad c:\Windows\system32\drivers\etc\hosts (To verify)
   ,,,

Using Your Environment
----------------------

Check that fischer.dev is hosting your shiny new dev environment.
            *'username' => 'admin',
			*'password' => 'password',

## Database:

    * Download workbench here:
           http://dev.mysql.com/downloads/workbench/

    * On "Setup New Connection"
        *Connection Method:  "Standard TCP/IP over SSH"
        *SSH Hostname:       fischer.dev:22
        *SSH Username:       vagrant
        *    NO PASSWORD
        *SSH Key File:       <Project PATH>\vagrant\puphpet\files\dot\ssh\id_rsa
        *                       For me it was:
        *                      C:\Users\jlivesay\Projects\Fischer\vagrant\puphpet\files\dot\ssh\id_rsa

        *MySQL Hostname:     127.0.0.1
        *Port:               3306
        *MySql Username:     root
        *Password:           Click store in vault and type "fischer"
        *Default Schema:     fischer_apps (optional)

        *Click on the Advanced tab and "Use Compression Protocol"

        *Test and Save.

Database Update Script
----------------------

    There is an included database update script that uses the mysql database found in website/sql/fischer_apps.sql
    The default behavior of this script is to import the db the first time, then leave it alone forever after that.
    To modify the behavior of the script take a look at website/sql/settings.conf
    The script runs only on vagrant up,  so you'll need to change the settings then vagrant halt && vagrant up
    You can export changes that you've made, import the changed sql file,  keep it up to date w/ the repo or restore
    backups.


##A little more info about vagrant.
    ,,,
    $ vagrant halt (stops the machine)
    $ vagrant destroy (deletes the machine)
    $ vagrant up (brings it back online)
    $ vagrant provision --provision (reprovisions when changes happen)
    ,,,

NEXT STEPS
----------
    ##Head over to website/README.md and get your git ready merge and deploy.  Skip down to the "Team Collaboration" section.







INTERNAL USE
-------------
#FIX:
    *Trouble running vagrant on VM with bridged connection.
    
#TODO:
    *document the script to run database updates without provisioning
    *Workout Network vs Subnet issues.
    *Keep this documentation up to date.
    *To apply server config changes after a pull
    **   $ cd <project>/vagrant && vagrant provision --provision


