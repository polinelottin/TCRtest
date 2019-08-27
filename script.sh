date=`date +"%F %T"`

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

        git commit -m 'TCR working $date @ $hostname';
        

        echo $(git status);

    else
        git reset --hard

        echo $(git status);
    fi
done
