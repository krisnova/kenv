#!/bin/bash


#ulimit -n 2048

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

# SSH Agent for kops
ssh-add ~/.ssh/id_rsa

# GoLang
#
# Setup $GOPATH to /go
export GOPATH=/go
export GOBIN=/go/bin
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/Users/kris/kenv/bin:$GOPATH/bin

# Emacs
export EDITOR=/usr/local/bin/emacs
alias emacs=/usr/local/bin/emacs

#
# kenv bin
#
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/Users/kris/Workspace/kenv/bin:$GOPATH/bin:$DIR/bin

# List of commonly used aliases I use. This is lifted directly from my ~/.bash_profile

export KOPS_NAME="demo.nivenly.com"
export KOPS_STATE_STORE="s3://nivenly-state-store"

# Friendlies for kops dev
alias kopscc="kops create cluster --zones us-west-1a -v 10 ${KOPS_NAME}"
alias kopsccy="kops create cluster --zones us-west-1a --yes -v 10 ${KOPS_NAME}"
alias kopsccpnb="kops create cluster --zones us-west-1a --topology private --bastion --networking weave $KOPS_NAME"
alias kopsccpnby="kops create cluster --zones us-west-1a --topology private --bastion --networking weave $KOPS_NAME --yes"
alias kopsccpny="kops create cluster --zones us-west-1a --yes -v 10 --networking weave --topology private ${KOPS_NAME}"
alias kopsdc="kops delete cluster --yes ${KOPS_NAME} -v 10"
alias kopsec="kops edit cluster ${KOPS_NAME}"
alias kopsuc="kops upgrade cluster --yes ${KOPS_NAME} -v 10"
alias kopsmake="cd /go/src/k8s.io/kops && make"


# Friendlies for k8s
alias k=kubectl

# The next line updates PATH for the Google Cloud SDK.
#if [ -f /Users/kris/google-cloud-sdk/path.bash.inc ]; then
#  source '/Users/kris/google-cloud-sdk/path.bash.inc'
#fi

# The next line enables shell command completion for gcloud.
#if [ -f /Users/kris/google-cloud-sdk/completion.bash.inc ]; then
#  source '/Users/kris/google-cloud-sdk/completion.bash.inc'
#fi


# Deis Controller
export DEIS_REGISTRY=quay.io/
export IMAGE_PREFIX=knova
export SHORT_NAME="controller-dev"


# Soops handy alias for all the logging things.. because I am lazy and hate copypasta!
klog(){
    PO=$(kubectl get po --all-namespaces | grep $1)
    kubectl logs $(echo $PO | cut -d " " -f 2) -n $(echo $PO | cut -d " " -f 1) -f
}


# Alias to compile golang dep
depmake(){
    cd $GOPATH/src/github.com/golang/dep/cmd/dep
    go build .
    mv dep /go/bin
    chmod +x /go/bin/dep
    #    /go/bin/dep "$@"
    cd -
}

book(){
    BRANCH=`git branch | grep \* | cut -d ' ' -f2`
    git add .
    git commit -m "Another book commit"
    git push atlas ${BRANCH}
    git push origin ${BRANCH}
    O=$(atlas build --pdf -b ${BRANCH})
    LINK=$(echo $O | cut -d ">" -f 2)
    open $LINK
}

export DOCKER_REGISTRY=krisnova

findfile() {
    find . -name "${1}"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kris/google-cloud-sdk/path.bash.inc' ]; then source '/Users/kris/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kris/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/kris/google-cloud-sdk/completion.bash.inc'; fi

