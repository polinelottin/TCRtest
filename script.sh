#!/bin/bash 

fswatch -0 $@ -e ".*" -i "\\.py$" | while read -d "" event; \
do \
    pytest;

    if [ $? = 0 ]
    then 
        # echo $(git status); 
        # echo ''; 

        echo "IHU! Passou, bora commitar!";
        git add -A;


        # echo $(git status); 
        # echo '';

        # date=`date +"%F %T"`

        git commit -m 'TCR working $(date +%F)';
        

        # echo $(git status);

    else
        echo fail;
        # git reset --hard

        # echo $(git status);
    fi
done
