#!/bin/bash

# fswatch -0 . | while read -d "" event; \
# do \
#    echo $(git status);
#    echo hellooooo ${event};
# done

fswatch -0 $@ -e ".*" -i "\\.py$" | while read -d "" event; \
do \
   #echo hellooooo ${event};
    pytest;

    #echo result is $?;

    if [ $? = 0 ]
    then 
        echo $(git status); 
        echo '';   
        echo "Passou, vou adicionar tudo";
        git add -A;


        echo $(git status); 
        echo '';
        echo "nhaaa! Comitando"
        git commit -m 'TCR working $(date) @ $(hostname)'
        

        echo $(git status);

    else
        git reset --hard

        echo $(git status);
    fi
done


#fswatch -0 . | xargs -0 -n 1 -I 'git status'  

# fswatch . | echo 'git status'
#pytest
