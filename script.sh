#!/bin/bash 

fswatch -0 $@ -e ".*" -i "\\.py$" | while read -d "" event; \
do \
    pytest;

    if [ $? = 0 ]
    then 
        # echo $(git status); 
        # echo ''; 

        date=`date +"%F %T"`

        echo "IHU! Passou, bora commitar!";
        git add -A;
        git commit -m "TCR working ${date}";

        # echo $(git status);

    else
        echo fail;
        # git reset --hard

        # echo $(git status);
    fi
done
