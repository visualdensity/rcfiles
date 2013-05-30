# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

# Navigation
alias www='cd /var/www/vhosts'
alias dd='cd ~/Dev'
alias dg='cd ~/Dev/git'
alias vv='cd ~/Dev/git/vagrant/'

# Symfony specific
alias sf='php app/console'

# Misc
alias afind='ack-grep -il'
alias tmux="TERM=screen-256color-bce tmux"

# Below taken from Paul Irish's (@paulirish) dotfiles (Thanks!)
# Ref: https://github.com/paulirish/dotfiles

# Requires: http://pygments.org/
alias c='pygmentize -O style=monokai -f console256 -g'

# List only directories
alias lsd='ls -l | grep "^d"'

# View HTTP traffic
alias sniff="ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# File size
alias fs="stat -f \"%z bytes\""

alias v="vagrant"

export AWS_CONFIG_FILE=/Users/wchin/.aws.conf

function regions {
    echo "AWS Regions List"
    echo "================="
    echo "  * ap-southeast-2 (Sydney)"
    echo "  * us-east-1 (N Virginia)"
    echo "  * us-west-2 (Oregon)"
    echo "  * us-west-1 (N California)"
    echo "  * eu-west-1 (Ireland)"
    echo "  * ap-southeast-1 (Singapore)"
    echo "  * ap-northeast-1 (Tokyo)"
    echo "  * sa-east-1 (Sao Paulo)"
}

function ec2 {
    aws ec2 describe-instances --instance-ids $@ | jq '.Reservations[].Instances[] | {State: .State.Name, AZ: .Placement.AvailabilityZone, KeyName, PublicDnsName, PrivateDnsName, PublicIpAddress, InstanceType, InstanceId, Tags: [.Tags[]]}'
}

function ec2s {
    aws ec2 describe-instances --filter '{"name":"instance-state-name", "values":"running"}' | jq '.Reservations[].Instances[] | {State: .State.Name, AZ: .Placement.AvailabilityZone, KeyName, PublicDnsName, PrivateDnsName, PublicIpAddress, InstanceType, InstanceId}'
}
