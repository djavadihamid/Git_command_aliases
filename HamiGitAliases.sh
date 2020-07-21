gc(){
        if [ -z "$1" ]
        then
                echo "Provide msg buddy";
                return;
        fi;

        git add *;
        git commit -m "$1";
}

pushAll(){
	remotes=$(git remote -v)
        SAVEIFS=$IFS
        IFS=$'\n'
        remotes=($remotes)
        IFS=$SAVEIFS

        remoteNames=()
        for (( i=0; i<${#remotes[@]}; i++ ))
        do
            remoteNames[i]=$(echo "${remotes[$i]}" | head -n1 | awk '{print $1;}')
        done

        remoteNames2=($(echo "${remoteNames[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

        for (( i=0; i<${#remoteNames2[@]}; i++ ))
        do
                git push ${remoteNames2[$i]} master;
        done

}

ss(){
        git status;
}

lol(){
        git log --oneline;
}

remote(){
        git remote -v;
}

cls(){
        clear;
}

qq(){
        exit;
}


proxyOn(){
        git config --global http.proxy fodev.org:8118;
        git config --global https.proxy fodev.org:8118;
}

proxyOff(){
        git config --global --unset http.proxy
        git config --global --unset https.proxy
}

gcgl(){
        git config --global --list
}

cb(){
	if [ -z "$1" ]
        then
                echo "remember to provide new branch name!";
                return;
        fi;

	git checkout -b $1;
}

br(){
	git branch;
}

upSuMo(){
        git submodule update --remote;
}

InSuMo(){
        git submodule init
}