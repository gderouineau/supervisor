#!/bin/bash

# ----------------- INSTALLATION OF SUPERVISOR ----------------- #

# ALLOW YOU TO RUN NODEJS
# PROGRAM AS A SERVICE
# IN DEBIAN AND UBUNTU
#

# -----------------        REQUIREMENT          ----------------- #

echo " WELCOME IN SUPERVISOR INSTALLATION"
echo ""

apt-get install sudo
sudo apt-get update
sudo apt-get upgrade

sudo npm install -g supervisor

if [[ $? -eq 0 ]]
    then
        echo "\033[32mSuccessfull installation of supervisor module\033[37m"
        sudo apt-get -qqy install python-setuptools
        if [[ $? -eq 0 ]]
            then
                echo "\033[32mSuccessfull installtion of python-setuptools\033[37m"
                sudo easy-install supervisor
                if [[ $? -eq 0 ]]
                    then
                        echo "\033[32mSuccessfull installtion of supervisor python module\033[37m"
                        sudo cp file/supervisord /etc/init.d/
                        if [[ $? -eq 0 ]]
                            then
                                echo "\033[32mSuccessfull creation of supervisor config file\033[37m"
                                sudo chmod +x /etc/init.d/supervisord && sudo update-rc.d supervisord defaults
                                if [[ $? -eq 0 ]]
                                    then
                                        echo "\033[32mSuccessfull add of supervisor at start\033[37m"
                                        sudo cp file/supervisord.conf /etc/
                                        if [[ $? -eq 0 ]]
                                            then
                                                echo -p 'enter the name at the user to run the program : ' USER
                                                sed -i 's/%USER%/'"$USER"'/' /etc/supervisord.conf
                                                echo -p 'enter the name of your application : ' NAME
                                                sed -i 's/%NAME%/'"$NAME"'/' /etc/supervisord.conf
                                                echo -p 'enter the directory location of the script you need to run : ' DIRECTORY
                                                sed -i 's/%DIRECTORY%/'"$DIRECTORY"'/' /etc/supervisord.conf
                                                echo -p 'enter the name of the script to run : ' SCRIPT
                                                echo "\033[32mSuccessfull add of supervisor config file\033[37m"
                                                sed -i 's/%SCRIPT%/'"$SCRIPT"'/' /etc/supervisord.conf

                                                sudo service supervisord stop
                                                sudo service supervisord start
                                                if [[ $? -eq 0 ]]
                                                    then
                                                        echo "\033[32mSuccessfull start of supervisor\033[37m"
                                                else
                                                    echo "\033[31mUnsuccessfull start of supervisor\033[37m"
                                                fi
                                        else
                                            echo "\033[31mUnsuccessfull add of supervisor config file\033[37m"
                                        fi
                                else
                                    echo "\033[31mUnsuccessfull add of supervisor at start\033[37m"
                                fi
                        else
                            echo "\033[31mUnsuccessfull creation of supervisor config file\033[37m"
                        fi
                else
                    echo "\033[31mUnsuccessfull installation of supervisor python module\033[37m"
                fi
        else
            echo "\033[31mUnsuccessfull installation of python-setuptools\033[37m"
        fi
else
    echo "\033[31mUnsuccessfull installation of supervisor module\033[37m"
fi
